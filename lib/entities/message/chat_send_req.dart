import 'dart:convert';

import 'package:juai/common/store/chat.dart';
import 'package:juai/common/store/user.dart';

import 'chat_prompt.dart';

class GptImageSize {
  static String size256 = "256x256";
  static String size512 = "512x512";
  static String size1024 = "1024x1024";
}

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
  factory ChatSendReqEntity.fromInitJson(String content, int conversationId) {
    var data = ChatSendReqEntity(
      contextType: UserStore.to.gptTokenSettings.value.contextType,
      conversationId: conversationId,
      promptId: ChatStore.to.currentChatPrompt == null ? ChatStore.to.lastChat!.promptId : ChatStore.to.currentChatPrompt!.id,
      chatMessages: [
        ChatMessage(
          role: ChatPromptRoleEnum.user.name,
          content: content,
          name: null,
        ),
      ],
    );
    if (ChatStore.to.currentChatPrompt != null) {
      data.chatMessages.insertAll(
        0,
        ChatStore.to.currentChatPrompt!.prompts
            .map((e) => ChatMessage(
                  role: e.role,
                  content: e.prompt,
                  name: null,
                ))
            .toList(),
      );
    }
    return data;
  }
  factory ChatSendReqEntity.fromPrompt(int conversationId, ChatPromptEntity prompt) => ChatSendReqEntity(
        contextType: UserStore.to.gptTokenSettings.value.contextType,
        conversationId: conversationId,
        promptId: ChatStore.to.currentChatPrompt == null ? ChatStore.to.lastChat!.promptId : ChatStore.to.currentChatPrompt!.id,
        chatMessages: prompt.prompts
            .map((e) => ChatMessage(
                  role: e.role,
                  content: e.prompt,
                  name: null,
                ))
            .toList(),
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
  String imageSize;
  int imageNum;

  ChatSendImageReqEntity({
    required this.conversationId,
    required this.prompt,
    required this.imageSize,
    required this.imageNum,
  });
  factory ChatSendImageReqEntity.fromRawJson(String str) => ChatSendImageReqEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory ChatSendImageReqEntity.fromJsonBySetting(int cId, String prompt) => ChatSendImageReqEntity(
        conversationId: cId,
        prompt: prompt,
        imageSize: ChatStore.to.gptImageSetting["ImageSize"] ?? GptImageSize.size256,
        imageNum: ChatStore.to.gptImageSetting["ImageNum"] ?? 1,
      );
  factory ChatSendImageReqEntity.fromJson(Map<String, dynamic> json) => ChatSendImageReqEntity(
        conversationId: json["ConversationId"],
        prompt: json["Prompt"],
        imageSize: json["ImageSize"],
        imageNum: json["ImageNum"],
      );

  Map<String, dynamic> toJson() => {
        "ConversationId": conversationId,
        "Prompt": prompt,
        "ImageSize": imageSize,
        "ImageNum": imageNum,
      };
}
