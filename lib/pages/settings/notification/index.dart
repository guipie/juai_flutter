import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/common/widgets/ui/cell.dart';

/// HACK: 消息通知

class SettingsNotificationPage extends StatefulWidget {
  const SettingsNotificationPage({Key? key}) : super(key: key);

  @override
  State<SettingsNotificationPage> createState() => _SettingsNotificationPageState();
}

class _SettingsNotificationPageState extends State<SettingsNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息通知'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Cell(
                '允许新消息通知',
                right: Transform.scale(
                  scale: .8,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Cell(
                '声音提示',
                right: Transform.scale(
                  scale: .8,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Cell(
                '震动提示',
                right: Transform.scale(
                  scale: .8,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
