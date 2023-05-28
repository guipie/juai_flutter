import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/utils/qiniu_sdk.dart';

class PublishSpecialController extends GetxController {
  PublishSpecialController();
  var titleController = TextEditingController();
  var summaryConroller = TextEditingController();
  var myAllSpecials = <SpecialResEntity>[];
  var currentCover = "".obs;
  var isPay = false.obs;
  @override
  Future<void> onInit() async {
    myAllSpecials = await SpecialApi.getMine();
    super.onInit();
  }

  saveSpecial() {
    try {
      var entity = SpecialReqEntity(
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
        SpecialApi.add(entity).then((value) => {Get.offNamed(Routes.bbsPublishArticle, arguments: value)});
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
