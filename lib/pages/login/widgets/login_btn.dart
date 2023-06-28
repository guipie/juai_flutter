import 'package:juai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:juai/pages/login/controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (_) => GFButton(
        onPressed: _.canLogin.value ? () => _.login() : null,
        color: GFColors.SUCCESS,
        text: Get.currentRoute == Routes.settingsLoginByVocde ? "进  入" : "登  录",
        icon: const Icon(Icons.login_outlined),
        type: GFButtonType.solid,
        blockButton: true,
      ),
    );
  }
}
