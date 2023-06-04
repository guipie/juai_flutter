import 'dart:convert';

import 'package:JuAI/common/assets.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:JuAI/pages/conversation/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController {
  ConversationController();

  final state = ConversationState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    rootBundle.loadString(Assets.roleJson).then((value) {
      List jsonList = json.decode(value);
      state.chatRoles = jsonList.map((m) => ChatRoleEntity.fromJson(m)).toList();
      debugPrint("加载成功${state.chatRoles.length}");
    }).catchError((err) {
      debugPrint("加载失败$err");
    });
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
