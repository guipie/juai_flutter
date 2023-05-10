import 'package:guxin_ai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/wcao/ui/cell.dart';
import 'package:get/get.dart';

/// HACK: 账户设置

class SettingsAccountPage extends StatefulWidget {
  const SettingsAccountPage({Key? key}) : super(key: key);

  @override
  State<SettingsAccountPage> createState() => _SettingsAccountPageState();
}

class _SettingsAccountPageState extends State<SettingsAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账号设置'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Cell('修改密码', onTap: () => Get.toNamed(Routes.settingsUpdatePwd)),
            Cell('更换绑定手机号', onTap: () => Get.toNamed(Routes.settingsUpdatePhone)),
            Cell('注销账号', onTap: () => Get.toNamed(Routes.settingsLoginout)),
          ],
        ),
      ),
    );
  }
}
