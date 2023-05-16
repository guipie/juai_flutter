import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/common/apis/apis.dart';
import 'package:guxin_ai/common/entities/content.dart';
import 'package:guxin_ai/common/services/storage.dart';
import 'package:guxin_ai/common/utils/loading.dart';
import 'package:guxin_ai/common/utils/qiniu_sdk.dart';
import 'package:guxin_ai/common/values/storage.dart';
import 'package:guxin_ai/pages/bbs/publish/state.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'widgets/bbs_tag.dart';

class PublishController extends GetxController {
  PublishController();
  final state = PublishState();
  @override
  Future<void> onInit() async {
    super.onInit();
    state.dongtaiController.addListener(() {
      if (state.dongtaiController.text.isNotEmpty || state.dongtaiPics.isNotEmpty || state.dongtaiVideos.isNotEmpty) {
        state.currentSendType.value = SendType.cansend;
      } else {
        state.currentSendType.value = SendType.nosend;
      }
    });
  }

  @override
  void dispose() {
    state.videoController.dispose();
    super.dispose();
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
        Loading.success(state.articleTitleController.text);
        addReqEntity.title = state.articleTitleController.text;
        var text = StorageService.to.getString(STORAGE_ARTICLE_TEXT);
        addReqEntity.summary = text.substring(0, text.length > 200 ? 199 : text.length - 1);
        addReqEntity.content = StorageService.to.getString(STORAGE_ARTICLE_DELTA);
      } else {
        return Loading.error("错误");
      }
      addReqEntity.tags = state.currentTags.join(",");
      state.currentSendType.value = SendType.sending;
      await ContentAPI.contentAdd(addReqEntity).then((value) => {if (value > 0) Get.back()});
    } catch (e) {
      Future.error(e);
    } finally {
      Loading.dismiss();
    }
  }

  openImage(BuildContext context) async {
    state.dongtaiVideos.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
    for (var f in result!.files) {
      if (f.path == null) continue;
      state.dongtaiPics.add(DongtaiFile(path: f.path!, percentage: 0.0));
      state.currentSendType.value = SendType.cansend;
    }
  }

  openVideo(BuildContext context) async {
    state.dongtaiPics.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video, allowMultiple: false);
    try {
      Loading.loading("加载中...");
      for (var f in result!.files) {
        if (f.path == null) continue;
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
