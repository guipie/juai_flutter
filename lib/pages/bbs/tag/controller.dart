import 'package:get/get.dart';

class TagController extends GetxController {
  TagController();
  var tag = "";

  // _initData() {
  //   update(["tag"]);
  // }

  void onTap() {}

  @override
  void onInit() {
    tag = Get.arguments;
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   // _initData();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
