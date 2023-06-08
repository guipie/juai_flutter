import 'dart:convert';

import 'package:JuAI/entities/message/chat_role.dart';

class ChatSendReqEntity {
  int contentNum;
  List<ChatMessage> chatMessages;

  ChatSendReqEntity({
    required this.contentNum,
    required this.chatMessages,
  });

  factory ChatSendReqEntity.fromRawJson(String str) => ChatSendReqEntity.fromJson(json.decode(str));
  factory ChatSendReqEntity.fromInitJson(String content, {int cNum = 0}) => ChatSendReqEntity(
        contentNum: cNum,
        chatMessages: [
          ChatMessage(
            role: ChatRoleEnum.user.name,
            content: content,
            name: null,
          ),
        ],
      );

  String toRawJson() => json.encode(toJson());

  factory ChatSendReqEntity.fromJson(Map<String, dynamic> json) => ChatSendReqEntity(
        contentNum: json["ContentNum"],
        chatMessages: List<ChatMessage>.from(json["ChatMessages"].map((x) => ChatMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ContentNum": contentNum,
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
