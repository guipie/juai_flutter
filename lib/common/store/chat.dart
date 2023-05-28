import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/utils/db_sqlite.dart';
import 'package:get/get.dart';

class ChatStore extends GetxController {
  static ChatStore get to => Get.find();
  var lastConversions = List<ConversationLast>.empty(growable: true).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    lastConversions.value = await DbSqlite.instance.queryAll("chat_last").then((value) => value.map((e) => ConversationLast.fromJson(e)).toList());
    debugPrint("初始化会话列表：${lastConversions.length}条");
  }

  void setLastConversion() {}
}
