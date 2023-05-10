import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/hub_connection.dart';

class BbsState {
  var curPage = 0;
  final List<String> tabs = const [
    "社区",
  ];
  late PageController pageController;
  late TabController tabController;
  late HubConnection hubConnection;
  var jitChatGpts = <Map<String, String>>[].obs;
  final jitScrollController = ScrollController();
}
