import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/utils/db_sqlite.dart';
import 'package:JuAI/common/utils/http_chat.dart';
import 'package:JuAI/pages/conversation/chat/state.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  final state = ChatState();
  String chatOpenAiId = "";
  int conversationId = 0;
  @override
  Future<void> onInit() async {
    conversationId = Get.arguments ?? 0;
    if (conversationId == 0) return;
    var chatRole = ChatStore.to.chatRoles.firstWhereOrNull((element) => element.id == conversationId);
    if (chatRole != null) {
      state.chatRoleEntity = ChatRoleEntity.fromJson(chatRole.toJson());
      state.chatRoleEntity.avatar = Assets.dataAvatarPrefix + state.chatRoleEntity.avatar + ".png";
    } else {
      state.chatRoleEntity.id = conversationId;
    }
    state.messageController.addListener(() {
      debugPrint(state.messageController.text);
      if (state.messageController.text.trim().isNotEmpty) {
        state.sendType.value = SendType.canSend;
      } else {
        state.sendType.value = SendType.canNotSend;
      }
    });
    await DbSqlite.instance.queryWhereOrderBy("chat", "conversationId=?", [state.chatRoleEntity.id], 20, "id desc").then((value) {
      state.chats.value = value.map((e) => Conversation.fromJson(e)).toList();
      Future.delayed(const Duration(milliseconds: 200), () => _toBottom());
    });
    super.onInit();
  }

  @override
  void dispose() {
    state.scrollContrller.dispose();
    state.messageController.dispose();
    conversationId = 0;
    super.dispose();
  }

  void onSend() {
    if (state.messageController.text.isNotEmpty && state.sendType.value == SendType.canSend) {
      state.sendType.value = SendType.sending;
      try {
        var sendMsg = state.messageController.text.toString();
        state.messageController.text = "";
        state.currentChat.value = "思考中..";
        _toAddChatStore(Conversation.fromJsonFromMine(sendMsg, chatOpenAiId, state.chatRoleEntity));
        var openAiStreamChat = HttpChat().chatStreamProxy(sendMsg);
        openAiStreamChat.listen(
          (event) {
            debugPrint("聊天中$event");
            if (state.currentChat.value == "思考中..") state.currentChat.value = "";
            state.currentChat.value = state.currentChat.value + (event.choices.first.delta.content ?? '');
            chatOpenAiId = event.id;
            _toBottom();
          },
        ).onDone(() {
          debugPrint("数据接收完毕[${state.currentChat.value}]");
          var answerChat = Conversation.fromJsonFromChatGPT(state.currentChat.value, chatOpenAiId, state.chatRoleEntity);
          state.sendType.value = SendType.canSend;
          state.currentChat.value = "";
          _toAddChatStore(answerChat);
          _toAddChatLastStore(answerChat);
        });
      } catch (e) {
        debugPrint("聊天出错$e");
      }
    }
  }

  Future<void> onSendImage() async {
    if (!GetUtils.isNullOrBlank(state.messageController.text)! && state.sendType.value == SendType.canSend) {
      var sendMsg = state.messageController.text.toString();
      state.messageController.text = "";
      _toAddChatStore(Conversation.fromJsonFromMine(sendMsg, chatOpenAiId, state.chatRoleEntity));
      state.sendType.value = SendType.sending;
      var openAiStreamChat = await HttpChat().chatImageProxy(sendMsg);
      debugPrint("图片接收完成${openAiStreamChat.data.first}");
      var answerChat = Conversation.fromJsonFromChatGPT(openAiStreamChat.data.first.url!, chatOpenAiId, state.chatRoleEntity);
      _toAddChatStore(answerChat);
      _toAddChatLastStore(answerChat);
      _toBottom();
    }
  }

  void _toBottom() {
    // 滚动到最底部
    state.scrollContrller.animateTo(
      0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void _toAddChatStore(Conversation conversation) {
    state.chats.insert(0, conversation);
    DbSqlite.instance.insert("chat", conversation.toJson());
    Future.delayed(const Duration(milliseconds: 200), () => _toBottom());
  }

  void _toAddChatLastStore(Conversation conversation) {
    var lastChat = ConversationLast(
      conversationId: conversation.conversationId,
      lastSender: state.chatRoleEntity.name,
      lastSenderAvatar: state.chatRoleEntity.avatar,
      lastSendTime: dateFormatYMDHMS(DateTime.now()),
      content: conversation.content,
      draf: state.messageController.text,
    );
    ChatStore.to.lastConversions.removeWhere((element) => element.conversationId == conversation.conversationId);
    ChatStore.to.lastConversions.add(lastChat);
    DbSqlite.instance.insertExist("chat_last", lastChat.toJson(), "conversationId=?", [conversation.conversationId]);
  }

  stopChat() {
    Loading.success("已停止");
  }
}
