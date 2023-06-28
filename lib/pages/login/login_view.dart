import 'package:juai/common/routers/routes.dart';
import 'package:juai/pages/login/widgets/password_text.dart';
import 'package:flutter/material.dart';
import 'package:juai/pages/login/controller.dart';
import 'package:juai/pages/login/widgets/login_btn.dart';
import 'package:juai/pages/login/widgets/username_text.dart';
import 'package:juai/common/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

// 密码登录
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final logic = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 1.sw / 10),
            margin: const EdgeInsets.only(bottom: 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserNameText(),
                const PasswrodText(),
                const SizedBox(height: 20),
                const LoginBtn(),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0,
                        child: Text(
                          "忘记密码?",
                          style: TextStyle(
                            color: WcaoTheme.placeholder,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed(Routes.settingsLoginByVocde);
                        },
                        child: Text(
                          "注册/忘记密码?",
                          style: TextStyle(
                            color: WcaoTheme.secondary,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "登录即同意",
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      InkWell(child: const Text('《用户协议》'), onTap: () => Get.toNamed(Routes.settingsAgreementUser)),
                      Text(
                        "及",
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      InkWell(child: const Text('《隐私政策》'), onTap: () => Get.toNamed(Routes.settingsAgreementPrivacy)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 密码登录
}
