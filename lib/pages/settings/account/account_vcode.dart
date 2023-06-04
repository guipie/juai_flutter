import 'package:flutter/material.dart';
import 'package:JuAI/common/apis/user_api.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/entities/user_login.dart';

enum VerifyCodeType {
  resetPwd,
  resetPhone,
}

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  /// update_phone 更换手机号验证
  /// reset_password 重置密码
  late VerifyCodeType type;
  var newPwd = "";
  var newPhone = "";
  @override
  void initState() {
    super.initState();
    try {
      type = VerifyCodeType.values.firstWhere((element) => element.name == Get.arguments.toString());
      if (type == VerifyCodeType.resetPwd) {
        UserAPI.sendVcode(UserStore.to.userInfo.value!.phone);
        newPwd = Get.parameters['newpwd'] ?? "";
      }
      if (type == VerifyCodeType.resetPhone) {
        newPhone = Get.parameters['newphone'] ?? "";
        UserAPI.sendVcode(newPhone);
      }
    } catch (e) {
      Loading.error("跳转类型出错");
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    var vcodeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '验证码已发送',
                style: TextStyle(
                  fontSize: WcaoTheme.fsBase * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  type == VerifyCodeType.resetPhone ? newPhone : UserStore.to.userInfo.value!.phone,
                  style: TextStyle(color: WcaoTheme.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48),
                height: 50,
                child: TextField(
                  controller: vcodeController,
                  keyboardType: TextInputType.phone,
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
              InkWell(
                onTap: () async {
                  if (vcodeController.text.trim().length >= 4) {
                    if (type == VerifyCodeType.resetPwd) {
                      UserAPI.resetPwd(UserLoginRequestEntity(
                        userName: UserStore.to.userInfo.value!.userName,
                        newPassword: newPwd,
                        vcode: vcodeController.text.trim(),
                      )).then((value) {
                        Get.back();
                      });
                    } else if (type == VerifyCodeType.resetPhone) {
                      UserAPI.resetPhone(PhoneUpdateReq(
                        newPhone: newPhone,
                        vcode: vcodeController.text.trim(),
                      )).then((value) {
                        //  if (value.isOk) Get.until((route) => route.settings.name == Routes.settingsAccount);
                        if (value.isOk) UserStore.to.onLogout(isMust: true);
                      });
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: WcaoTheme.primary,
                    borderRadius: WcaoTheme.radius,
                  ),
                  child: const Text(
                    '确认',
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
