import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guxin_ai/common/apis/user_api.dart';
import 'package:guxin_ai/common/entities/user.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/store/store.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var userName = TextEditingController(text: "18600766045");
  var password = TextEditingController(text: "123456");
  var vcode = TextEditingController();
  var canLogin = false.obs;
  var isSendingVcode = false.obs;
  var sendingVcodeTxt = "发送验证码".obs;
  @override
  void onInit() {
    var route = Get.currentRoute;
    if (UserStore.to.isLogin && UserStore.to.userInfo != null && UserStore.to.tokenInfo != null) {
      Routes.toHome();
    }
    userName.addListener(() {
      if (userName.text.isNotEmpty && ((route == Routes.settingsLogin && password.text.isNotEmpty) || (route == Routes.settingsLoginByVocde && vcode.text.isNotEmpty))) {
        canLogin.value = true;
      } else {
        canLogin.value = false;
      }
    });
    password.addListener(() {
      if (userName.text.isNotEmpty && password.text.isNotEmpty) {
        canLogin.value = true;
      } else {
        canLogin.value = false;
      }
    });
    vcode.addListener(() {
      if (userName.text.isNotEmpty && vcode.text.isNotEmpty) {
        canLogin.value = true;
      } else {
        canLogin.value = false;
      }
    });
    super.onInit();
  }

  void login() {
    if (!canLogin.value) return;
    if (!GetUtils.isNullOrBlank(userName.text)!) {
      UserAPI.login(UserLoginRequestEntity(userName: userName.text, password: password.text, vcode: vcode.text)).then((value) {
        debugPrint(value.message);
        if (value.isOk) {
          UserStore.to.saveProfile(UserLoginResponseEntity.fromJson(value.data["userResponse"]), UserTokenResponseEntity.fromJson(value.data["tokenInfo"])).then((value) => Routes.toHome());
        }
      });
    } else {
      EasyLoading.showToast("输入正确的手机号或邮箱");
    }
  }

  void sendVcode() {
    if (isSendingVcode.value == false) {
      isSendingVcode.value = true;
      var seconds = 61;
      UserAPI.sendVcode(userName.text).then((value) {
        if (value.isOk) {
          Timer.periodic(const Duration(seconds: 1), (timer) {
            seconds--;
            sendingVcodeTxt.value = seconds.toString();
            if (seconds <= 1) {
              timer.cancel();
              sendingVcodeTxt.value = "发送验证码";
              isSendingVcode.value = false;
            }
          });
        } else {
          isSendingVcode.value = false;
        }
      });
    }
  }
}
