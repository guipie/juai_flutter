import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/apis/content_special_api.dart';
import 'package:guxin_ai/common/entities/content.dart';
import 'package:guxin_ai/common/entities/content_special.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/utils/loading.dart';
import 'package:guxin_ai/common/utils/qiniu_sdk.dart';

class PublishSpecialController extends GetxController {
  PublishSpecialController();
  var titleController = TextEditingController();
  var summaryConroller = TextEditingController();
  var myAllSpecials = <ContentSpecialResEntity>[];
  var currentCover = "".obs;
  var isPay = false.obs;
  @override
  Future<void> onInit() async {
    myAllSpecials = await ContentSpecialApi.getMine();
    super.onInit();
  }

  saveSpecial() {
    try {
      var entity = ContentSpecialReqEntity(
        title: titleController.text.trim(),
        summary: summaryConroller.text.trim(),
        coverImage: currentCover.value,
        readType: isPay.value ? BaReadType.Pay : BaReadType.Pub,
        payTokens: 0,
      );
      if (entity.title.isEmpty || entity.summary.isEmpty || entity.coverImage.isEmpty) return Loading.waring("请输入完整数据");
      Loading.loading("发布中....");
      QiniuUtil.saveFile(File(entity.coverImage), FileType.image, folder: "special").then((value) {
        entity.coverImage = value;
        ContentSpecialApi.add(entity).then((value) => {Get.offNamed(Routes.bbsPublishArticle, arguments: value)});
      });
    } catch (e) {
      Loading.error("发布失败");
    } finally {
      Loading.dismiss();
    }
  }

  openSpecialImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    currentCover.value = result!.files.first.path!;
  }
}
