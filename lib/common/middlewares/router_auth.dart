import 'package:flutter/material.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/store/user.dart';

import 'package:get/get.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware({required super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return null;
    if (UserStore.to.isLogin || route == Routes.settingsLogin || route == Routes.settingsLoginout || route == Routes.homeConversation) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return const RouteSettings(name: Routes.settingsLogin);
    }
  }
}
