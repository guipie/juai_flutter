import 'package:juai/pages/settings/mine/hudong/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SettingMyHudongPage extends GetView<SettingMyHudongController> {
  const SettingMyHudongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingMyHudongController>(
      init: SettingMyHudongController(),
      id: "hudong",
      builder: (_) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Text("全部"),
                  Text("评论"),
                  Text("点赞收藏"),
                ],
              ),
              title: const Text('我的互动'),
            ),
            body: Obx(
              () => NotificationListener(
                onNotification: _.handleScrollNotification,
                child: TabBarView(
                  children: [
                    HudongListWidget([..._.ccontents, ..._.likeContents], _.isLoading),
                    HudongListWidget(_.ccontents, _.isLoading),
                    HudongListWidget(_.likeContents, _.isLoading),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
