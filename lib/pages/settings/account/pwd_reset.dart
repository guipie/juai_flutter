import 'package:flutter/material.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/utils/loading.dart';
import 'package:juai/common/theme.dart';
import 'package:get/get.dart';
import 'package:juai/pages/settings/account/account_vcode.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<PasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    var newPwdController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("重置密码"),
        ),
        body: SafeArea(
          child: InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 26),
              margin: const EdgeInsets.only(bottom: 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '设置新密码',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: WcaoTheme.base,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      '密码至少8位，包含数字/字母/字符组合',
                      style: TextStyle(color: WcaoTheme.secondary),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 36),
                    height: 50,
                    child: TextField(
                      controller: newPwdController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "请输入新密码",
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
                  InkWell(
                    onTap: () {
                      if (newPwdController.text.trim().isNotEmpty) {
                        Get.toNamed(Routes.settingsEnterVcode + "?newpwd=" + newPwdController.text.trim(), arguments: VerifyCodeType.resetPwd.name);
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 36),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: WcaoTheme.radius,
                        color: WcaoTheme.primary,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '确认',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
