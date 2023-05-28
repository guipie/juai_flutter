import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialController extends GetxController {
  SpecialController();
  var specialId = 0;
  var contents = <ContentResEntity>[].obs;
  void onTap() {}
  @override
  Future<void> onInit() async {
    specialId = Get.arguments;
    await _getContents(true);
    super.onInit();
  }

  _getContents(bool isFirst) async {
    var list = await SpecialApi.getSpecialContents(specialId);
    if (isFirst) {
      contents.value = list;
    } else {
      contents.addAll(list);
    }
    debugPrint("contentscontents${contents.length}");
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
