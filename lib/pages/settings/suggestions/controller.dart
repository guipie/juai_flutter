import 'dart:io';

import 'package:juai/common/apis/common_api.dart';
import 'package:juai/common/store/user.dart';
import 'package:juai/common/utils/loading.dart';
import 'package:juai/common/utils/permission_check.dart';
import 'package:juai/common/utils/qiniu_sdk.dart';
import 'package:juai/pages/bbs/publish/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class SuggestionsController extends GetxController {
  SuggestionsController();

  var txtController = TextEditingController();
  var dongtaiPics = <DongtaiFile>[].obs;
  var dongtaiVideos = <DongtaiFile>[].obs;
  late VideoPlayerController videoController;
  var isDrag = false.obs;
  var videoPlaying = false.obs;
  List<AssetEntity>? selectedAssets;
  _initData() {
    update(["suggestions"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  toSave() async {
    if (txtController.text.trim().isEmpty) return Loading.waring("请输入..");
    var files = <String>[];
    for (var element in [...dongtaiPics, ...dongtaiVideos]) {
      files.add(await QiniuUtil.saveFile(
        File(element.path),
        dongtaiPics.isNotEmpty ? FileType.image : FileType.video,
        folder: "suggestions",
        isLoading: true,
        key: UserStore.to.userInfo.value!.userName + (element.name ?? element.path.substring(element.path.length - 4, element.path.length)),
        progressListener: (progress) {
          element.percentage = progress;
        },
      ));
    }
    CommonApis.addSuggestions(txtController.text, files: files).then((value) {
      if (value) Get.back();
    });
  }

  openImage(BuildContext context) async {
    bool isCheck = await permissionCheckAndRequest(context, Permission.photos, "读取图片");
    if (!isCheck) return;
    dongtaiVideos.clear();
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
      dongtaiPics.clear();
      for (var f in result) {
        var file = await f.file;
        if (file == null) continue;
        dongtaiPics.add(DongtaiFile(path: file.path, percentage: 0.0, name: f.title));
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
      if (result != null) {
        for (var f in result.files) {
          if (f.path == null) continue;
          dongtaiPics.add(DongtaiFile(path: f.path!, percentage: 0.0, name: f.name));
        }
      }
    }
  }

  openVideo(BuildContext context) async {
    bool isCheck = await permissionCheckAndRequest(context, Permission.videos, "读取视频");
    if (!isCheck) return;
    dongtaiPics.clear();
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
      dongtaiVideos.clear();
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
        dongtaiVideos.add(DongtaiFile(path: f.path!, percentage: 0.0));
        // videoController = VideoPlayerController.file(
        //   File(f.path!),
        //   videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
        // )..initialize().then((_) {
        //     dongtaiVideos.add(DongtaiFile(path: f.path!, percentage: 0.0));
        //     currentSendType.value = SendType.cansend;
        //   });
      }
    } catch (e) {
      Loading.error("加载出错了");
    } finally {
      Loading.dismiss();
    }
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
