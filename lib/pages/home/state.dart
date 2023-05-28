import 'package:JuAI/common/routers/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeState {
  var currentPcRoute = Routes.homeConversation.obs;
  var currentMobile = 0.obs;
  PageController phonePageController = PageController();
}
