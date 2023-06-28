import 'dart:async';

import 'package:juai/common/apis/chat_api.dart';
import 'package:juai/common/store/store.dart';
import 'package:juai/common/utils/utils.dart';
import 'package:juai/entities/message/chat_prompt.dart';
import 'package:juai/entities/message/chat_send_req.dart';
import 'package:flutter/material.dart';
import 'package:juai/entities/message/conversation.dart';
import 'package:juai/common/store/chat.dart';
import 'package:juai/common/utils/db_sqlite.dart';
import 'package:juai/pages/conversation/chat/state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends GetxController {
  ChatController();
  final state = ChatState();
  ConversationLast? lastChat;
  @override
  void onInit() {
    debugPrint("当前聊天对象：${ChatStore.to.lastChat!.toJson()}");
    lastChat = ChatStore.to.lastChat;
    state.messageController.addListener(() {
      debugPrint(state.messageController.text);
      if (state.messageController.text.trim().isNotEmpty) {
        ChatStore.to.sendType.value = SendType.canSend;
      } else {
        ChatStore.to.sendType.value = SendType.canNotSend;
      }
    });
    if (lastChat == null) return;
    ChatStore.to.scrollContrller.addListener(() {
      if (ChatStore.to.scrollContrller.position.pixels == ChatStore.to.scrollContrller.position.maxScrollExtent) {
        debugPrint("滑动到底部了");
        Future.delayed(const Duration(milliseconds: 500), () {
          if (state.loadStatus.value == LoadStatus.canLoading) _loadChats(isFirst: false);
        });
      }
    });
    _loadChats();
    super.onInit();
  }

  _loadChats({bool isFirst = true}) {
    state.loadStatus.value = LoadStatus.loading;
    var where = "conversationId=?";
    var whereVal = [lastChat!.conversationId];
    if (ChatStore.to.chats.isNotEmpty) {
      where += " and id<?";
      whereVal.add(ChatStore.to.chats.last.id!);
    }
    DbSqlite.instance.queryWhereOrderBy("chat", where, whereVal, 10, "id desc").then((value) {
      debugPrint("加载聊天记录列表：${value.length},$where,$whereVal");
      if (value.length == 10) {
        state.loadStatus.value = LoadStatus.canLoading;
      } else {
        state.loadStatus.value = LoadStatus.noMore;
      }
      ChatStore.to.chats.addAll(value.map((e) => Conversation.fromJson(e)).toList());
      if (ChatStore.to.chats.isEmpty && ChatStore.to.currentChatPrompt != null) {
        toAddPrompt(ChatStore.to.currentChatPrompt);
      }
      if (isFirst) Future.delayed(const Duration(milliseconds: 200), () => ChatStore.to.toBottom());
    });
  }

  toAddPrompt(ChatPromptEntity? prompt) {
    if (prompt != null) {
      ChatStore.to.currentChatPrompt = prompt;
      for (var i = 0; i < prompt.prompts.length; i++) {
        var element = prompt.prompts[i];
        var _conversation = Conversation.fromJsonFromMine(element.prompt, null, ChatStore.to.lastChat!);
        if (element.role != ChatPromptRoleEnum.user.name) _conversation = Conversation.fromJsonFromChatGPT(element.prompt, null, ChatStore.to.lastChat!);
        ChatStore.to.toAddChatStore(_conversation);
        ChatStore.to.toAddChatLastStore(_conversation);
      }
      ChatStore.to.currentChat.value = "思考中..";
      ChatApis.sendChatGPT(ChatSendReqEntity.fromPrompt(lastChat!.conversationId, prompt)).then((value) {
        if (!value.isOk) {
          ChatStore.to.currentChat.value = "";
          UserStore.to.userInfo.value!.tokenNum = value.data;
          return Loading.waring(value.message ?? "无法聊天");
        }
      }).catchError((err) {
        Loading.waring("聊天出错了$err");
        ChatStore.to.sendType.value = SendType.canSend;
        ChatStore.to.currentChat.value = "";
      });
    }
  }

  @override
  void dispose() {
    state.messageController.dispose();
    lastChat = ChatStore.to.lastChat = null;
    ChatStore.to.scrollContrller.dispose();
    super.dispose();
  }

  void onSend(BuildContext context) {
    if (state.drawImage.value) {
      onSendImage();
    } else {
      onSendChat(context);
    }
  }

  void onSendChat(BuildContext context) {
    if (state.messageController.text.trim().isNotEmpty && ChatStore.to.sendType.value == SendType.canSend) {
      ChatStore.to.sendType.value = SendType.sending;
      var sendMsg = state.messageController.text.trim().toString();
      state.messageController.text = "";
      ChatStore.to.toAddChatStore(Conversation.fromJsonFromMine(sendMsg, null, lastChat!));
      ChatStore.to.currentChat.value = "思考中..";
      ChatApis.sendChatGPT(ChatSendReqEntity.fromInitJson(sendMsg, lastChat!.conversationId)).then((value) {
        if (!value.isOk) {
          ChatStore.to.currentChat.value = "";
          UserStore.to.userInfo.value!.tokenNum = value.data;
          return Loading.waring(value.message ?? "无法聊天");
        }
        FocusScope.of(context).requestFocus(state.messageFocusNode);
      }).catchError((err) {
        Loading.waring("聊天出错了$err");
        ChatStore.to.sendType.value = SendType.canSend;
        ChatStore.to.currentChat.value = "";
      });
    }
  }

  void onSendImage() {
    if (state.messageController.text.trim().isNotEmpty && ChatStore.to.sendType.value == SendType.canSend) {
      ChatStore.to.sendType.value = SendType.sending;
      var sendMsg = state.messageController.text.trim().toString();
      state.messageController.text = "";
      ChatStore.to.toAddChatStore(Conversation.fromJsonFromMine(sendMsg, null, lastChat!));
      ChatStore.to.currentChat.value = "思考中..";
      ChatApis.sendChatGPTImage(ChatSendImageReqEntity.fromJsonBySetting(lastChat!.conversationId, sendMsg)).then((value) {
        if (!value.isOk) {
          ChatStore.to.currentChat.value = "";
          UserStore.to.userInfo.value!.tokenNum = value.data;
          return Loading.waring(value.message ?? "无法聊天");
        }
      }).catchError((err) {
        Loading.waring("画图出错了$err");
        ChatStore.to.sendType.value = SendType.canSend;
        ChatStore.to.currentChat.value = "";
      });
    }
  }

  stopChat() {
    Loading.success("已停止");
  }

  Future<bool> pageBack() async {
    debugPrint("返回了");
    if (ChatStore.to.chats.isNotEmpty) ChatApis.addConversation(lastChat!);
    return true;
  }
}
