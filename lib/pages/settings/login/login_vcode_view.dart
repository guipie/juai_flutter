import 'package:guxin_ai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/pages/settings/login/controller.dart';
import 'package:guxin_ai/pages/settings/login/widgets/login_btn.dart';
import 'package:guxin_ai/pages/settings/login/widgets/username_text.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 验证码登录
class LoginVerifyCodePage extends StatelessWidget {
  LoginVerifyCodePage({Key? key}) : super(key: key);
  final logic = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("注册/忘记密码"),
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
                buildVerifyCode(),
                const LoginBtn(),
                InkWell(
                  onTap: () {
                    Get.offAndToNamed(Routes.settingsLogin);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: const Text(
                      "密码登录",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                      InkWell(
                        child: const Text('《用户协议》'),
                        onTap: () => Navigator.pushNamed(context, "/agreement/user"),
                      ),
                      Text(
                        "及",
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      InkWell(
                        child: const Text('《隐私政策》'),
                        onTap: () => Navigator.pushNamed(context, "/agreement/privacy"),
                      ),
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

  /// 验证码
  Column buildVerifyCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: InkWell(
            child: Text(
              '验证码',
              style: TextStyle(
                fontSize: 14,
                color: WcaoTheme.placeholder,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 50,
              child: TextField(
                controller: logic.vcode,
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "请输入验证码",
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
                    borderSide: BorderSide(
                      color: WcaoTheme.primaryFocus,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () => logic.sendVcode(),
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  height: 50,
                  child: Obx(
                    () => Text(
                      logic.sendingVcodeTxt.value,
                      style: TextStyle(
                        fontSize: 14,
                        color: logic.isSendingVcode.value ? WcaoTheme.placeholder : WcaoTheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
