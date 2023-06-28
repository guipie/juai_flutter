import 'package:juai/pages/bbs/view.dart';
import 'package:juai/pages/bbs_chat/view.dart';
import 'package:juai/pages/conversation/role/view.dart';
import 'package:juai/pages/home/controler.dart';
import 'package:juai/pages/settings/view.dart';
import 'package:flutter/material.dart';
import 'package:juai/pages/conversation/view.dart';

import 'package:juai/common/theme.dart';
import 'package:get/get.dart';

/// 首页 PageView Controller.
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.state.phonePageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const ConversationPage(),
          // BbsChatPage(),
          const RolePage(),
          BbsPage(),
          SettingsPage(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: WcaoTheme.primary,
      //   onPressed: () {
      //     Get.toNamed('/publish');
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            controller.state.currentMobile.value = value;
            controller.state.phonePageController.jumpToPage(value);
          },
          currentIndex: controller.state.currentMobile.value,
          showUnselectedLabels: true,
          selectedItemColor: WcaoTheme.primary,
          unselectedItemColor: WcaoTheme.secondary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              activeIcon: Icon(Icons.chat_bubble),
              label: "消息",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.six_ft_apart_outlined),
              activeIcon: Icon(Icons.six_ft_apart),
              label: "角色",
            ),
            //  BottomNavigationBarItem(
            //   icon: Icon(Icons.live_help_outlined),
            //   activeIcon: Icon(Icons.live_help_sharp),
            //   label: "广场",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined),
              activeIcon: Icon(Icons.home_work),
              label: "社区",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              activeIcon: Icon(Icons.person_outline),
              label: "我的",
            ),
          ],
        ),
      ),
    );
  }
}
