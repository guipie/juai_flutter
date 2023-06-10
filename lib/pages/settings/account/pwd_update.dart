import 'package:JuAI/common/apis/user_api.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';
import 'package:JuAI/entities/user/user_login.dart';

class PasswordUpdatePage extends StatefulWidget {
  const PasswordUpdatePage({Key? key}) : super(key: key);

  @override
  State<PasswordUpdatePage> createState() => _PasswordUpdatePageState();
}

class _PasswordUpdatePageState extends State<PasswordUpdatePage> {
  var oldPwdController = TextEditingController();
  var newPwdController = TextEditingController();
  var newConfirmPwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("修改密码"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: oldPwdController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "请输入原密码",
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: TextField(
                    controller: newConfirmPwdController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "再次输入密码",
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
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '密码至少8位，包含数字，字母组合',
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                      InkWell(
                        onTap: () => Get.offAndToNamed(Routes.settingsForgetPwd),
                        child: Text(
                          "忘记密码？",
                          style: TextStyle(color: WcaoTheme.primary),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (newConfirmPwdController.text.isEmpty || newConfirmPwdController.text.trim() != newPwdController.text.trim()) {
                      return Loading.waring("确认密码不一致");
                    }
                    UserAPI.resetPwd(UserLoginRequestEntity(
                      userName: UserStore.to.userInfo.value!.userName,
                      password: oldPwdController.text.trim(),
                      newPassword: newPwdController.text.trim(),
                    )).then((value) {
                      if (value.isOk) Get.back();
                    });
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
        ));
  }
}
