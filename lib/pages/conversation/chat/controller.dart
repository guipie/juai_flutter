import 'package:flutter/material.dart';
import 'package:guxin_ai/common/models/conversation.dart';
import 'package:guxin_ai/common/store/chat.dart';
import 'package:guxin_ai/common/utils/db_sqlite.dart';
import 'package:guxin_ai/common/utils/http_chat.dart';
import 'package:guxin_ai/pages/conversation/chat/state.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  final state = ChatState();
  @override
  Future<void> onInit() async {
    state.messageController.addListener(() {
      if (state.messageController.text.trim().isNotEmpty) {
        state.sendType.value = SendType.canSend;
      } else {
        state.sendType.value = SendType.canNotSend;
      }
    });
    state.currentConversationId = DateTime.now().microsecondsSinceEpoch.toString();
    if (Get.arguments != null && Get.arguments.toString().isNotEmpty) {
      state.currentConversationId = Get.arguments;
      state.chats.value = await DbSqlite.instance.queryAll("chat").then((value) => value.map((e) => Conversation.fromJson(e)).toList());
    }
    Future.delayed(const Duration(milliseconds: 500), () => _toBottom());
    super.onInit();
  }

  @override
  void onReady() {
    _toBottom();
    super.onReady();
  }

  @override
  void dispose() {
    state.scrollContrller.dispose();
    state.messageController.dispose();
    super.dispose();
  }

  void onSend() {
    if (!GetUtils.isNullOrBlank(state.messageController.text)! && state.sendType.value == SendType.canSend) {
      var sendMsg = state.messageController.text;
      state.chatId = state.chats.isNotEmpty ? state.chats[state.chats.length - 1].chatId + "mine" : "1";
      _toAddChatStore(Conversation.fromJsonFromMine(state.currentConversationId, state.chatId, sendMsg));
      _toBottom();
      state.openAiStreamChat = HttpChat().chatStreamProxy(sendMsg);
      state.sendType.value = SendType.sending;
      state.messageController.text = "";
      state.openAiStreamChat.listen(
        (event) {
          state.currentChat.value += event.choices[0].delta.content ?? '';
          state.chatId = event.id;
          _toBottom();
        },
      ).onDone(() {
        debugPrint("数据接收完毕");
        var answerChat = Conversation.fromJsonFromChatGPT(state.currentConversationId, state.chatId, state.currentChat.value);
        _toAddChatStore(answerChat);
        _toAddChatLastStore(answerChat);
        state.sendType.value = SendType.canSend;
        state.currentChat.value = "";
        _toBottom();
      });
    }
  }

  void _toBottom() {
    // 滚动到最底部
    state.scrollContrller.animateTo(
      state.scrollContrller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void _toAddChatStore(Conversation conversation) {
    state.chats.add(conversation);
    DbSqlite.instance.insert("chat", conversation.toJson());
  }

  void _toAddChatLastStore(Conversation conversation) {
    var lastChat = conversation.toJson();
    lastChat["draf"] = state.messageController.text;
    ChatStore.to.lastConversions.removeWhere((element) => element.conversationId == conversation.conversationId);
    ChatStore.to.lastConversions.add(ConversationLast.fromJson(lastChat));
    DbSqlite.instance.insertExist("chat_last", lastChat, "conversationId=?", [conversation.conversationId]);
  }
}
