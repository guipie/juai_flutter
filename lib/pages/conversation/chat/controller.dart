import 'dart:async';

import 'package:JuAI/common/apis/chat_api.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/entities/message/chat_prompt.dart';
import 'package:JuAI/entities/message/chat_send_req.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/message/conversation.dart';
import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/utils/db_sqlite.dart';
import 'package:JuAI/pages/conversation/chat/state.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  final state = ChatState();
  ConversationLast? lastChat;
  @override
  void onInit() {
    debugPrint("当前聊天对象：${ChatStore.to.lastChat!.toJson()}");
    lastChat = ChatStore.to.lastChat;
    if (lastChat == null) return;
    state.messageController.addListener(() {
      debugPrint(state.messageController.text);
      if (state.messageController.text.trim().isNotEmpty) {
        ChatStore.to.sendType.value = SendType.canSend;
      } else {
        ChatStore.to.sendType.value = SendType.canNotSend;
      }
    });
    DbSqlite.instance.queryWhereOrderBy("chat", "conversationId=?", [lastChat!.conversationId], 20, "id desc").then((value) {
      ChatStore.to.chats.value = value.map((e) => Conversation.fromJson(e)).toList();
      if (ChatStore.to.chats.isEmpty && ChatStore.to.currentChatPrompt != null) {
        toAddPrompt(ChatStore.to.currentChatPrompt);
      }
      Future.delayed(const Duration(milliseconds: 200), () => ChatStore.to.toBottom());
    });
    ChatApis.addConversation(lastChat!);
    super.onInit();
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
    super.dispose();
  }

  void onSend() {
    if (state.drawImage.value) {
      onSendImage();
    } else {
      onSendChat();
    }
  }

  void onSendChat() {
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
      ChatApis.sendChatGPTImage(ChatSendImageReqEntity(conversationId: lastChat!.conversationId, prompt: sendMsg)).then((value) {
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
}
