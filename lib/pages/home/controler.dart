import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/pages/bbs/view.dart';
import 'package:JuAI/pages/bbs_chat/view.dart';
import 'package:JuAI/pages/conversation/view.dart';
import 'package:JuAI/pages/settings/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  Widget pcRoutePage() {
    if (state.currentPcRoute.value == Routes.bbs) {
      return const BbsPage();
    } else if (state.currentPcRoute.value == Routes.bbsChat) {
      return BbsChatPage();
    } else if (state.currentPcRoute.value == Routes.settings) {
      return SettingsPage();
    } else {
      return const ConversationPage();
    }
  }
}
