import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/core/styles/ju_colors.dart';
import 'package:juai_flutter/app/global_widgets/common/common_widget.dart';
import 'package:juai_flutter/app/modules/conversation/views/conversation_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: controller.selectPageIndex.value,
        children: const [
          ConversationView(),
          ConversationView(),
          ConversationView(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: getFilterWidget(
        hasColor: false,
        child: Obx(
          () => BottomNavigationBar(
            onTap: (index) {
              controller.selectPageIndex.value = index;
            },
            backgroundColor: JuColors.glassColor,
            currentIndex: controller.selectPageIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset("images/frame/frame_chat_active.svg"),
                icon: SvgPicture.asset("images/frame/frame_chat.svg"),
                label: "CHAT",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset("images/frame/frame_contacts_active.svg"),
                icon: SvgPicture.asset("images/frame/frame_contacts.svg"),
                label: "Contacts",
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset("images/frame/frame_settings_active.svg"),
                icon: SvgPicture.asset("images/frame/frame_settings.svg"),
                label: "SETTING",
              )
            ],
          ),
        ),
      ),
    );
  }
}
