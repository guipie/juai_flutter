import 'package:JuAI/common/apis/chat_api.dart';
import 'package:JuAI/common/apis/content_api.dart';
import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/utils/db_sqlite.dart';
import 'package:JuAI/entities/message/conversation.dart';
import 'package:JuAI/pages/conversation/state.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController {
  ConversationController();

  final state = ConversationState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  toChat(ConversationLast conversationLast) {
    var converstion = state.conversations.firstWhereOrNull((element) => element.conversationId == conversationLast.conversationId && element.unread > 0);
    if (converstion != null) {
      converstion.unread = 0;
      state.conversations.refresh();
    }
    ChatStore.to.toChat(conversation: conversationLast);
  }

  toRemoveChat(int conversationId) {
    state.conversations.removeWhere((element) => element.conversationId == conversationId);
    DbSqlite.instance.delete("chat_last", where: "conversationId=?", whereArgs: [conversationId]);
    DbSqlite.instance.delete("chat", where: "conversationId=?", whereArgs: [conversationId]);
    ChatApis.delConversation(conversationId);
    // Loading.waring('已删除');
  }
}
