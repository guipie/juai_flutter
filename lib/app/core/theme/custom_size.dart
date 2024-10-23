import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSize {
  static const double appBarTitleSize = 16;
  static const double defaultHintTextSize = 14;
  static const double maxWindowSize = 1000;
  static const double smallWindowSize = 500;

  static double get toolbarHeight {
    if (GetPlatform.isIOS) {
      return kToolbarHeight + 30;
    }

    return kToolbarHeight;
  }
}
