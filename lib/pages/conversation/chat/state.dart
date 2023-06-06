import 'package:JuAI/common/assets.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:get/get.dart';

enum SendType { canNotSend, canSend, sending }

class ChatState {
  var drawImage = false.obs;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  var scrollContrller = ScrollController();
  var sendType = SendType.canNotSend.obs;
  //流临时存储的会话数据
  final ValueNotifier<String> currentChat = ValueNotifier("");
  var chats = <Conversation>[].obs; //当前会话列表
  ChatRoleEntity chatRoleEntity = ChatRoleEntity(
    avatar: Assets.robotAvatar,
    name: "AI机器人",
    context: [Context(role: "system", content: "You are ChatGPT, a large language model trained by OpenAI. Follow the user's instructions carefully. Respond using markdown.", date: DateTime.now().toString())],
    modelConfig: ModelConfig(model: "gpt-3.5-turbo", temperature: 1, maxTokens: 2000, presencePenalty: 0, sendMemory: true, historyMessageCount: 2, compressMessageLengthThreshold: 4000),
    lang: "cn",
    builtin: true,
    id: DateTime.now().second,
  );
}
