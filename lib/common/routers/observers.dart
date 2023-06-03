import 'package:JuAI/common/routers/pages.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class RouteObservers extends NavigatorObserver {
  var whitelistPages = [Routes.settingsLogin, Routes.settingsLoginByVocde, Routes.settingsAgreementPrivacy, Routes.settingsAgreementUser];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var currentRoute = route.settings.name ?? '';
    debugPrint("当前路由：$currentRoute");
    if (!whitelistPages.contains(currentRoute) && !UserStore.to.isLogin) {
      debugPrint("未登录未登录未登录未登录未登录");
      if (!UserStore.to.isLogin) {
        Get.offAllNamed(Routes.settingsLogin);
        return;
      }
    }
    if (currentRoute.isNotEmpty) AppPages.history.add(currentRoute);
    print('didPush');
    print(AppPages.history);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    AppPages.history.remove(route.settings.name);
    print('didPop');
    print(AppPages.history);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      var index = AppPages.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      var name = newRoute.settings.name ?? '';
      if (name.isNotEmpty) {
        if (index > 0) {
          AppPages.history[index] = name;
        } else {
          AppPages.history.add(name);
        }
      }
    }
    print('didReplace');
    print(AppPages.history);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    AppPages.history.remove(route.settings.name);
    print('didRemove');
    print(AppPages.history);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
