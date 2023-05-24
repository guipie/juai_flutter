import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/entities/conversation.dart';
import 'package:get/get.dart';

enum SendType { canNotSend, canSend, sending }

class ChatState {
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  var scrollContrller = ScrollController();
  var sendType = SendType.canNotSend.obs;
  //流临时存储的会话数据
  final ValueNotifier<String> currentChat = ValueNotifier("");
  var chats = <Conversation>[].obs; //当前会话列表
  String currentConversationId = ""; //当前会话ID
  String chatId = ""; //当前聊天
  late Stream<OpenAIStreamChatCompletionModel> openAiStreamChat;
}
