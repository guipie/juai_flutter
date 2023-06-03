import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/utils/permission_check.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class SelectFile {
  final String id;
  final int typeInt;
  int width;
  int height;
  final String? mimeType;
  final File file;
  SelectFile({
    required this.id,
    required this.typeInt,
    required this.width,
    required this.height,
    required this.file,
    double? latitude,
    double? longitude,
    this.mimeType,
  });
}

class FileUtils {
  static void openFile(BuildContext context, Function(List<SelectFile> selectedFiles) selectedFunc, {RequestType fileType = RequestType.image, List<AssetEntity>? selectedAssets, int maxAssets = 9}) async {
    List<SelectFile> selectedResult = <SelectFile>[];
    if (fileType == RequestType.image) {
      bool isCheck = await permissionCheckAndRequest(context, Permission.photos, "读取图片");
      if (!isCheck) return;
    }
    if (fileType == RequestType.video) {
      bool isCheck = await permissionCheckAndRequest(context, Permission.videos, "读取视频");
      if (!isCheck) return;
    }
    if (GetPlatform.isMobile) {
      var result = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          requestType: RequestType.image,
          maxAssets: maxAssets,
          selectedAssets: selectedAssets,
        ),
      );
      if (result == null) return;
      for (var element in result) {
        var sfile = await element.file;
        if (sfile != null) {
          selectedResult.add(SelectFile(
            id: element.id,
            typeInt: element.typeInt,
            width: element.width,
            height: element.height,
            file: sfile,
          ));
        }
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
      if (result != null) {
        for (var f in result.files) {
          if (f.path == null) continue;
          var sfile = SelectFile(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            typeInt: fileType.value,
            width: 400,
            height: 360,
            file: File(f.path!),
          );
          if (fileType == RequestType.image) {
            Image image = Image.file(File.fromUri(Uri.parse(f.path!)));
            // 预先获取图片信息
            image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) {
              sfile.width = info.image.width;
              sfile.height = info.image.height;
            }));
          }
          selectedResult.add(sfile);
        }
      }
    }
    if (selectedResult.isNotEmpty) selectedFunc(selectedResult);
  }
}
