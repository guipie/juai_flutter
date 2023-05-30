import 'package:JuAI/common/apis/statistics_api.dart';
import 'package:get/get.dart';

import 'state.dart';

class SettingsController extends GetxController {
  SettingsController();

  final state = SettingsState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    StatisticsApi.homeStatistics().then((value) {
      state.contentsNum.value = value["ContentNum"] ?? 0;
      state.hudongNum.value = value["HudongNum"] ?? 0;
    });
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
}
