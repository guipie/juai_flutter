import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BbsState {
  var curPage = 0;
  final List<String> tabs = const [
    "社区",
  ];
  late PageController pageController;
  late TabController tabController;

  var indexUploading = false.obs;
  var indexDownloading = false.obs;
}
