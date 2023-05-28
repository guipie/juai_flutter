import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/apis/notice_api.dart';

import 'package:JuAI/entities/message/notice.dart';

class NoticeStore extends GetxController {
  NoticeStore();

  var notices = <NoticesRes>[].obs;
  var noticeSetting = NoticeSettingRes(isAllowNotice: true, noticeType: "ring");
  @override
  Future<void> onInit() async {
    // NoticeApis.getAllNotice().then((value) => notices.value = value.map((e) => NoticesRes.fromJson(e)).toList());
    super.onInit();
  }

  Future<List> getAllNotice() {
    return NoticeApis.getAllNotice().then((value) {
      notices.value = value.map((e) => NoticesRes.fromJson(e)).toList();
      return value;
    }).catchError((err) => printError(info: "出错了$err"));
  }
}
