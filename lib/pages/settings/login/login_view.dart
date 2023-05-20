import 'package:guxin_ai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/pages/settings/login/controller.dart';
import 'package:guxin_ai/pages/settings/login/widgets/login_btn.dart';
import 'package:guxin_ai/pages/settings/login/widgets/username_text.dart';
import 'package:guxin_ai/common/theme.dart';
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
                buildPassWord(),
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
  Column buildPassWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                '密码',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 50,
          child: TextField(
            controller: logic.password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: "请输入密码",
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.outline,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
