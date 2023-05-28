import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/cell.dart';
import 'package:get/get.dart';

class SettingsPrivacyPage extends StatefulWidget {
  const SettingsPrivacyPage({Key? key}) : super(key: key);

  @override
  State<SettingsPrivacyPage> createState() => _SettingsPrivacyPageState();
}

class _SettingsPrivacyPageState extends State<SettingsPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('隐私'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Cell(
              '屏蔽联系人',
              right: Transform.scale(
                scale: .8,
                child: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
            Cell(
              '允许他人看到我的关注和被关注',
              right: Transform.scale(
                scale: .8,
                child: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ),
            Cell(
              '黑名单',
              onTap: () => Get.toNamed('/settings/backlist'),
            ),
          ],
        ),
      ),
    );
  }
}
