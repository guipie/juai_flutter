import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/core/utils/keyboard_helper.dart';
import 'package:juai_flutter/app/modules/login/views/login_code_page.dart';

class LoginController extends GetxController {
  late TextEditingController phoneController;
  late TextEditingController codeController;
  var inputSuccess = false.obs;
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    phoneController.addListener(() {
      inputSuccess.value = phoneController.text.isNotEmpty;
    });

    codeController = TextEditingController();
    codeController.addListener(() {
      inputSuccess.value = codeController.text.isNotEmpty;
    });
  }

  bool isCheckPhone = false;
  //检查手机号码 正确的话 进入 验证页面
  void checkPhone() async {
    KeyboardHelper.hide();
    if (!isCheckPhone) {
      isCheckPhone = true;
      String phone = phoneController.text;
      if (phone.isNotEmpty) {
        EasyLoading.show(status: "waiting..");
        // ignore: unused_local_variable
        await Future.delayed(const Duration(seconds: 1));
        //ServiceResult status = await AlService.sendCode(phone);
        EasyLoading.dismiss();
        //if (status.success) {
        Get.to(() => const LoginCodePage());
        EasyLoading.showSuccess("success.");
        //} else {
        // EasyLoading.showInfo(status.msg);
        //}
      }
      inputSuccess.value = isCheckPhone = false;
    }
  }

  bool isCheckCode = false;
  void checkCode() async {
    KeyboardHelper.hide();
    if (!isCheckCode) {
      isCheckCode = true;
      String phone = phoneController.text;
      String code = codeController.text;
      if (phone.isNotEmpty && code.isNotEmpty) {
        EasyLoading.show(status: "waiting..");
        await Future.delayed(const Duration(seconds: 3));
        //ServiceResult status = await AlService.login(phone, code);
        EasyLoading.dismiss();
        // if (status.success) {
        EasyLoading.showSuccess("success.");
        // } else {
        //   EasyLoading.showInfo(status.msg);
        // }
      }
      isCheckCode = false;
    }
  }
}
