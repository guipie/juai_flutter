import 'package:flutter/material.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/config.dart';
import 'package:JuAI/common/store/user.dart';

import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    return null;
    if (ConfigStore.to.isFirstOpen == true) {
      return const RouteSettings(name: Routes.home);
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: Routes.Application);
    } else {
      return const RouteSettings(name: Routes.settingsLogin);
    }
  }
}
