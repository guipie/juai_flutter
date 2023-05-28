import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/apis/apis.dart';
import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/utils/permission_check.dart';
import 'package:JuAI/common/utils/qiniu_sdk.dart';
import 'package:JuAI/common/values/storage.dart';
import 'package:JuAI/pages/bbs/publish/state.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'widgets/bbs_tag.dart';

class PublishController extends GetxController {
  PublishController();
  final state = PublishState();
  SpecialResEntity? specialInfo;
  List<AssetEntity>? selectedAssets;
  @override
  Future<void> onInit() async {
    state.dongtaiController.addListener(() {
      if (state.dongtaiController.text.isNotEmpty || state.dongtaiPics.isNotEmpty || state.dongtaiVideos.isNotEmpty) {
        state.currentSendType.value = SendType.cansend;
      } else {
        state.currentSendType.value = SendType.nosend;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    state.videoController.dispose();
    super.dispose();
  }

  Future<String> getSpecialData() async {
    if (Get.arguments != null && Get.arguments > 0) {
      specialInfo = await SpecialApi.get(Get.arguments);
      return "圈子：" + specialInfo!.title;
    }
    return "发布文章";
  }

  void saveContents(PublishType pub) async {
    ContentAddReqEntity addReqEntity = ContentAddReqEntity();
    try {
      if (pub == PublishType.dongtai) {
        var text = state.dongtaiController.text;
        if (text.isEmpty && state.dongtaiPics.isEmpty && state.dongtaiVideos.isEmpty) return Loading.waring("无内容发布");
        Loading.loading("发布中....");
        addReqEntity.title = text.substring(0, text.length > 20 ? 19 : text.length - 1);
        addReqEntity.summary = text.substring(0, text.length > 200 ? 199 : text.length - 1);
        addReqEntity.content = text;
        if (state.dongtaiPics.isNotEmpty) {
          addReqEntity.category = BaCategory.Image;
        } else if (state.dongtaiVideos.isNotEmpty) {
          addReqEntity.category = BaCategory.Video;
        } else {
          addReqEntity.category = BaCategory.Text;
        }
        for (var element in [...state.dongtaiPics, ...state.dongtaiVideos]) {
          element.url = await QiniuUtil.saveFile(
            File(element.path),
            addReqEntity.category == BaCategory.Image ? FileType.image : FileType.video,
            isInsertDb: true,
            progressListener: (progress) {
              element.percentage = progress;
            },
            completeListener: (path, fileId) {
              addReqEntity.fileIds = addReqEntity.fileIds ?? [];
              addReqEntity.fileIds!.add(fileId!);
            },
          );
        }
      } else if (pub == PublishType.article) {
        addReqEntity.category = BaCategory.Article;
        Loading.success(state.articleTitleController.text);
        addReqEntity.title = state.articleTitleController.text;
        var text = StorageService.to.getString(STORAGE_ARTICLE_TEXT);
        addReqEntity.summary = text.substring(0, text.length > 200 ? 199 : text.length - 1);
        addReqEntity.content = StorageService.to.getString(STORAGE_ARTICLE_DELTA);
        StorageService.to.remove(STORAGE_ARTICLE_TEXT);
        StorageService.to.remove(STORAGE_ARTICLE_DELTA);
      } else {
        return Loading.error("错误");
      }
      addReqEntity.tags = state.currentTags.join(",");
      state.currentSendType.value = SendType.sending;
      if (state.isPay.value) {
        var payTokens = int.tryParse(state.payController.text.trim());
        if (payTokens == null || payTokens < 1) return Loading.error("请输入付费token数");
        addReqEntity.readType = BaReadType.Pay;
        addReqEntity.payTokens = payTokens;
      }
      await ContentAPI.contentAdd(addReqEntity).then((value) => {if (value > 0) Get.back()});
    } catch (e) {
      Future.error(e);
    } finally {
      Loading.dismiss();
    }
  }

  openImage(BuildContext context) async {
    bool isCheck = await permissionCheckAndRequest(context, Permission.photos, "读取图片");
    if (!isCheck) return;
    state.dongtaiVideos.clear();
    if (GetPlatform.isMobile) {
      final List<AssetEntity>? result = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          requestType: RequestType.image,
          maxAssets: 9,
          selectedAssets: selectedAssets,
        ),
      );
      if (result == null) return;
      selectedAssets = result;
      state.dongtaiPics.clear();
      for (var f in result) {
        var file = await f.file;
        if (file == null) continue;
        state.dongtaiPics.add(DongtaiFile(path: file.path, percentage: 0.0));
        state.currentSendType.value = SendType.cansend;
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
      if (result != null) {
        for (var f in result.files) {
          if (f.path == null) continue;
          state.dongtaiPics.add(DongtaiFile(path: f.path!, percentage: 0.0));
          state.currentSendType.value = SendType.cansend;
        }
      }
    }
  }

  openVideo(BuildContext context) async {
    bool isCheck = await permissionCheckAndRequest(context, Permission.videos, "读取视频");
    if (!isCheck) return;
    state.dongtaiPics.clear();
    List<File>? files = [];
    if (GetPlatform.isMobile) {
      final List<AssetEntity>? selected = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          requestType: RequestType.video,
          maxAssets: 1,
          selectedAssets: selectedAssets,
        ),
      );
      if (selected == null) return;
      selectedAssets = selected;
      state.dongtaiVideos.clear();
      for (var ff in selected) {
        var file = await ff.file;
        if (file != null) files.add(file);
      }
    } else {
      FilePickerResult? selected = await FilePicker.platform.pickFiles(type: FileType.video, allowMultiple: false);
      files = selected?.files.map((e) => File(e.path!)).toList();
    }
    try {
      Loading.loading("加载中...");
      for (var f in files ?? []) {
        state.videoController = VideoPlayerController.file(
          File(f.path!),
          videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
        )..initialize().then((_) {
            state.dongtaiVideos.add(DongtaiFile(path: f.path!, percentage: 0.0));
            state.currentSendType.value = SendType.cansend;
          });
      }
    } catch (e) {
      Loading.error("加载出错了");
    } finally {
      Loading.dismiss();
    }
  }

  Future<void> toTag() async {
    var tags = await Get.to(const BbsAddTag());
    for (var element in (tags ?? []) as List) {
      var tag = "#" + element["Name"] + "#";
      if (state.currentTags.any((c) => c == tag)) continue;
      state.currentTags.add(tag);
    }
  }

  void tagClose(tag) {
    state.currentTags.remove(tag);
  }
}
