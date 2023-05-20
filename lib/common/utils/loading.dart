import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Loading {
  Loading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 2
      ..radius = 10.0
      ..progressColor = Colors.green
      ..backgroundColor = Colors.black.withOpacity(0.7)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = true
      ..dismissOnTap = false
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..maskType = EasyLoadingMaskType.custom;
  }
  static void confirm(String text, {Function()? onConfirm}) {
    Get.defaultDialog(
      title: "确认提示",
      middleText: text,
      radius: 30,
      textConfirm: "确认",
      textCancel: "取消",
      onConfirm: () {
        onConfirm?.call();
        Get.back();
      },
    );
  }

  static void loading([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: text ?? 'Loading...');
  }

  static void success([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showSuccess(text ?? '操作成功', duration: const Duration(seconds: 1));
  }

  static void waring([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showInfo(text ?? '操作失败', duration: const Duration(seconds: 2));
  }

  static void error([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showInfo(text ?? '出错了', duration: const Duration(seconds: 2));
  }

  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  static void progress(double progress, String txt) {
    EasyLoading.showProgress(
      progress,
      status: "hahaaa",
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}
