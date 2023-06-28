import 'package:flutter/material.dart';
import 'package:juai/pages/login/controller.dart';
import 'package:juai/common/theme.dart';
import 'package:get/get.dart';

class UserNameText extends GetView<LoginController> {
  const UserNameText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   '登录/注册',
        //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        // ),
        Container(
          margin: const EdgeInsets.only(top: 36),
          child: Wrap(
            children: [
              Text(
                '手机号码',
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
            controller: controller.userName,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              counterText: "",
              hintText: "请输入正确手机号",
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
      ],
    );
  }
}
