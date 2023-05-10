import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/hub_connection.dart';

class BbsChatState {
  final List<String> tabs = const ["最新", "优质推荐"];
  final currentTabIndex = 0.obs;
  late HubConnection hubConnection;
  var jitChatGpts = <Map<String, String>>[].obs;
  final jitScrollController = ScrollController();
}
