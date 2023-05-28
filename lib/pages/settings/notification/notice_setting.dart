import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/store/notice.dart';
import 'package:JuAI/common/widgets/cell.dart';

/// HACK: 消息通知设置

class SettingsNotificationSettingPage extends StatefulWidget {
  SettingsNotificationSettingPage({Key? key}) : super(key: key);

  final logic = Get.find<NoticeStore>();
  @override
  State<SettingsNotificationSettingPage> createState() => _SettingsNotificationSettingPageState();
}

class _SettingsNotificationSettingPageState extends State<SettingsNotificationSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知设置'),
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
                    value: widget.logic.noticeSetting.isAllowNotice,
                    onChanged: (value) {
                      setState(() {
                        widget.logic.noticeSetting.isAllowNotice = value;
                      });
                    },
                  ),
                ),
                isMustRight: false,
              ),
              Cell(
                widget.logic.noticeSetting.noticeType == "ring" ? '声音提示' : "震动提示",
                right: Transform.scale(
                  scale: .8,
                  child: CupertinoSwitch(
                    value: widget.logic.noticeSetting.noticeType == "ring",
                    onChanged: (value) {
                      setState(() {
                        widget.logic.noticeSetting.noticeType = value ? "ring" : "vibration";
                      });
                    },
                  ),
                ),
                isMustRight: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
