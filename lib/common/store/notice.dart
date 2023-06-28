import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juai/common/apis/notice_api.dart';

import 'package:juai/entities/message/notice.dart';

class NoticeStore extends GetxController {
  NoticeStore();
  static NoticeStore get to => Get.find();
  var notices = <NoticesRes>[].obs;
  var noticeSetting = NoticeSettingRes(isAllowNotice: true, noticeType: "ring");

  @override
  void onInit() {
    // NoticeApis.getAllNotice().then((value) => notices.value = value.map((e) => NoticesRes.fromJson(e)).toList());

    super.onInit();
  }

  Future<List> getAllNotice() {
    return NoticeApis.getAllNotice().then((value) {
      notices.value = value.map((e) => NoticesRes.fromJson(e)).toList();
      return value;
    }).catchError((err) => debugPrint("出错了$err"));
  }
}
