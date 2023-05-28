import 'package:JuAI/common/apis/apis.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/entities/entities.dart';
import 'package:JuAI/pages/settings/account/account_vcode.dart';

/// HACK: 账号设置-验证当前手机号

class AccountPhoneUpdatePage extends StatefulWidget {
  const AccountPhoneUpdatePage({Key? key}) : super(key: key);

  @override
  State<AccountPhoneUpdatePage> createState() => _AccountPhoneUpdatePageState();
}

class _AccountPhoneUpdatePageState extends State<AccountPhoneUpdatePage> {
  @override
  Widget build(BuildContext context) {
    var newPhoneController = TextEditingController();
    var passWordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '更换手机号',
                style: TextStyle(
                  fontSize: WcaoTheme.fsBase * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  '更换新手机号后，请重新登录APP',
                  style: TextStyle(color: WcaoTheme.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48),
                height: 50,
                child: TextField(
                  controller: passWordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "输入您的密码",
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
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                child: TextField(
                  controller: newPhoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "请输入新的手机号码",
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
                  var newPhone = newPhoneController.text.trim();
                  if (GetUtils.isPhoneNumber(newPhone)) {
                    UserAPI.resetPhoneBefore(PhoneUpdateReq(newPhone: newPhone, password: passWordController.text.trim())).then((value) {
                      if (value.isOk) {
                        Get.toNamed(Routes.settingsEnterVcode + "?newphone=" + newPhone, arguments: VerifyCodeType.resetPhone.name);
                      }
                    });
                  } else {
                    Loading.waring("请输入正确手机号");
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 36),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: WcaoTheme.primary,
                    borderRadius: WcaoTheme.radius,
                  ),
                  child: const Text(
                    '更换',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
