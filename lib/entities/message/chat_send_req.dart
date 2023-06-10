import 'dart:convert';

import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/store/user.dart';

import 'chat_prompt.dart';

class ChatSendReqEntity {
  int contextType; // 0不保持上下文，-1保持全部上下文，其他保持当前会话个数的上下文
  int conversationId;
  int? promptId;
  List<ChatMessage> chatMessages;

  ChatSendReqEntity({
    required this.contextType,
    required this.conversationId,
    this.promptId,
    required this.chatMessages,
  });

  factory ChatSendReqEntity.fromRawJson(String str) => ChatSendReqEntity.fromJson(json.decode(str));
  factory ChatSendReqEntity.fromInitJson(String content, int conversationId) => ChatSendReqEntity(
        contextType: UserStore.to.tokenEntity.value.contextType,
        conversationId: conversationId,
        promptId: ChatStore.to.currentChatPrompt == null ? null : ChatStore.to.currentChatPrompt!.id,
        chatMessages: [
          ChatMessage(
            role: ChatPromptRoleEnum.user.name,
            content: content,
            name: null,
          ),
        ],
      );

  String toRawJson() => json.encode(toJson());

  factory ChatSendReqEntity.fromJson(Map<String, dynamic> json) => ChatSendReqEntity(
        contextType: json["ContextType"],
        conversationId: json["ConversationId"],
        promptId: json["PromptId"],
        chatMessages: List<ChatMessage>.from(json["ChatMessages"].map((x) => ChatMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ContextType": contextType,
        "ConversationId": conversationId,
        "PromptId": promptId,
        "ChatMessages": List<dynamic>.from(chatMessages.map((x) => x.toJson())),
      };
}

class ChatMessage {
  String role;
  String content;
  String? name;

  ChatMessage({
    required this.role,
    required this.content,
    this.name,
  });

  factory ChatMessage.fromRawJson(String str) => ChatMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json["Role"],
        content: json["Content"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Role": role,
        "Content": content,
        "Name": name,
      };
}

class ChatSendImageReqEntity {
  int conversationId;
  String prompt;

  ChatSendImageReqEntity({
    required this.conversationId,
    required this.prompt,
  });

  factory ChatSendImageReqEntity.fromRawJson(String str) => ChatSendImageReqEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatSendImageReqEntity.fromJson(Map<String, dynamic> json) => ChatSendImageReqEntity(
        conversationId: json["ConversationId"],
        prompt: json["Prompt"],
      );

  Map<String, dynamic> toJson() => {
        "ConversationId": conversationId,
        "Prompt": prompt,
      };
}
