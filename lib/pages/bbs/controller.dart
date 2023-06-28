import 'package:juai/common/routers/routes.dart';
import 'package:juai/pages/bbs/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BbsController extends GetxController with GetSingleTickerProviderStateMixin {
  BbsController();
  final state = BbsState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.pageController = PageController(initialPage: state.curPage);

    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> toPublish(int index) async {
    if (index == 1) {
      Get.toNamed(Routes.bbsPublishDongtai);
    } else if (index == 2) {
      Get.toNamed(Routes.bbsPublishArticle);
    } else if (index == 3) {
      Get.toNamed(Routes.bbsPublishSpecial);
    }
  }
}
