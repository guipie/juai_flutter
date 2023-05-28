import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:JuAI/common/apis/notice_api.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/notice.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/bottommost.dart';

class SettingsNoticePage extends StatefulWidget {
  SettingsNoticePage({super.key});
  final logic = Get.find<NoticeStore>();
  @override
  State<SettingsNoticePage> createState() => _SettingsNoticePageState();
}

class _SettingsNoticePageState extends State<SettingsNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息通知'),
        actions: [
          InkWell(
            child: const Icon(Icons.settings),
            onTap: () {
              Get.toNamed(Routes.settingsNoticeSetting);
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: FutureBuilder(
        future: widget.logic.getAllNotice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (widget.logic.notices.isNotEmpty) {
              return ListView.builder(
                itemCount: widget.logic.notices.length, // 假设有10条通知消息
                itemBuilder: (context, index) {
                  var notice = widget.logic.notices[index];
                  return ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(notice.title),
                    subtitle: Text(
                      notice.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(dateFormat(notice.createTime, fmt: "yyyy-mm-dd")), // 通知时间
                    onTap: () {
                      Get.bottomSheet(
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(notice.content ?? notice.description),
                          ),
                        ),
                        backgroundColor: Colors.white,
                      );
                    },
                  );
                },
              );
            } else {
              return const BottommostWidget(false, isNodata: true);
            }
          } else {
            return const GFLoader();
          }
        },
      ),
    );
  }
}
