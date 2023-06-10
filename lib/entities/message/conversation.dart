import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/utils/date.dart';

import 'chat_prompt.dart';

class Conversation {
  Conversation({
    this.id,
    required this.conversationId,
    this.chatOpenAiId,
    required this.sendId,
    required this.recevieId,
    required this.sendTime,
    required this.receiveTime,
    required this.content,
  });
  int? id;
  int conversationId;
  String? chatOpenAiId;
  int sendId;
  int recevieId;
  String sendTime;
  String? receiveTime;
  String content;
  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        conversationId: json["conversationId"],
        chatOpenAiId: json["chatOpenAiId"],
        sendId: json["sendId"],
        recevieId: json["recevieId"],
        sendTime: json["sendTime"],
        receiveTime: json["receiveTime"],
        content: json["content"],
      );
  factory Conversation.fromJsonFromMine(String content, String? chatOpenAiId, ConversationLast last) => Conversation(
        conversationId: last.conversationId,
        chatOpenAiId: chatOpenAiId,
        sendId: UserStore.to.userId,
        recevieId: last.conversationId,
        sendTime: dateFormatYMDHMS(DateTime.now()),
        receiveTime: dateFormatYMDHMS(DateTime.now()),
        content: content,
      );
  factory Conversation.fromJsonFromChatGPT(String content, String? chatOpenAiId, ConversationLast last) => Conversation(
        conversationId: last.conversationId,
        chatOpenAiId: chatOpenAiId,
        sendId: last.conversationId,
        recevieId: UserStore.to.userId,
        sendTime: dateFormatYMDHMS(DateTime.now()),
        receiveTime: dateFormatYMDHMS(DateTime.now()),
        content: content,
      );
  factory Conversation.fromJsonToUser(int conversationId, String content, String? chatOpenAiId) => Conversation(
        conversationId: conversationId,
        chatOpenAiId: chatOpenAiId,
        sendId: UserStore.to.userId,
        recevieId: conversationId,
        sendTime: dateFormatYMDHMS(DateTime.now()),
        receiveTime: dateFormatYMDHMS(DateTime.now()),
        content: content,
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "conversationId": conversationId,
        "chatOpenAiId": chatOpenAiId,
        "sendId": sendId,
        "recevieId": recevieId,
        "sendTime": sendTime,
        "receiveTime": receiveTime,
        "content": content,
      };
}

class ConversationLast {
  int conversationId;
  int? promptId;
  String type;
  int? lastSenderId;
  String lastSender;
  String lastSenderAvatar;
  String lastSendTime;
  String content;
  String? draf;
  int unread;
  int userId;
  ConversationLast({
    required this.conversationId,
    this.promptId,
    this.lastSenderId,
    required this.lastSender,
    required this.lastSenderAvatar,
    required this.lastSendTime,
    required this.content,
    required this.type,
    this.draf,
    this.unread = 0,
    required this.userId,
  });
  factory ConversationLast.fromJson(Map<String, dynamic> json) => ConversationLast(
        conversationId: json["conversationId"],
        promptId: json["promptId"],
        type: json["type"] ?? ChatPromptRoleEnum.user.name,
        lastSender: json["lastSender"],
        lastSenderId: json["lastSenderId"],
        lastSenderAvatar: json["lastSenderAvatar"],
        lastSendTime: json["lastSendTime"],
        content: json["content"],
        draf: json["draf"],
        unread: json["unread"] ?? 0,
        userId: json["userId"] ?? UserStore.to.userId,
      );
  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "promptId": promptId,
        "type": type,
        "lastSender": lastSender,
        "lastSenderId": lastSenderId,
        "lastSenderAvatar": lastSenderAvatar,
        "lastSendTime": lastSendTime,
        "content": content,
        "draf": draf,
        "unread": unread,
        "userId": userId,
      };
}
