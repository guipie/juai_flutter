import 'package:flutter/material.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/pages/home/widgets/PcWidgetMeasure.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'controler.dart';

class HomePcPage extends GetView<HomeController> {
  const HomePcPage({super.key});

  ListTile _item(String text, String route, IconData unselect, IconData select) {
    final isSelected = controller.state.currentPcRoute.value == route;
    return ListTile(
      selected: isSelected,
      title: Text(
        text,
        textAlign: TextAlign.left,
      ),
      leading: Icon(isSelected ? select : unselect, size: 22.0),
      onTap: () {
        controller.state.currentPcRoute.value = route;
      },
    );
  }

  Widget _buildLeftView(BuildContext context) {
    return Obx(
      () => ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            selected: true,
            contentPadding: const EdgeInsets.only(left: 10, top: 50, right: 40, bottom: 50),
            style: ListTileStyle.drawer,
            title: Text(
              UserStore.to.userInfo.value!.userName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Container(
              margin: const EdgeInsets.only(left: 0),
              height: 60,
              width: 60,
              child: avatar(context: context, onClick: () => Get.toNamed(Routes.settingsMineHome)),
            ),
            trailing: InkWell(
              mouseCursor: MouseCursor.defer,
              hoverColor: Theme.of(context).primaryColorDark,
              child: Text(
                UserStore.to.isLogin ? "退出" : "登录",
                style: const TextStyle(fontSize: 14, letterSpacing: 8),
              ),
              onTap: () {
                if (UserStore.to.isLogin) {
                  UserStore.to.onLogout();
                } else {
                  Get.toNamed(Routes.settingsLogin);
                }
              },
            ),
          ),
          _item("消息会话", Routes.homeConversation, Icons.chat_bubble_outline_outlined, Icons.chat_bubble_sharp),
          _item("会话广场", Routes.bbsChat, Icons.live_help_outlined, Icons.live_help_sharp),
          _item("发现社区", Routes.bbs, Icons.home_work_outlined, Icons.home_work_sharp),
          _item("我的设置", Routes.settings, Icons.person_outline_outlined, Icons.person_sharp),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI对话")),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    colors: [WcaoTheme.bgColor, const Color.fromARGB(255, 35, 36, 36)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: _buildLeftView(context),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      trailing: Obx(
                        () => GFButton(
                          onPressed: () => ConfigStore.to.onDarkModeChage(),
                          padding: const EdgeInsets.only(left: 0),
                          text: ConfigStore.to.isDarkMode.value ? "暗黑模式" : "明亮模式",
                          icon: Icon(ConfigStore.to.isDarkMode.value ? Icons.wb_incandescent_sharp : Icons.wb_incandescent_outlined),
                          type: GFButtonType.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Obx(
                () => PcWidgetMeasure(
                  controller.pcRoutePage(),
                  (size) {
                    debugPrint("size:$size");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
