import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/entities/message/chat_role.dart';

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
  factory Conversation.fromJsonToUser(String content, String? chatOpenAiId, ChatRoleEntity chatRoleEntity) => Conversation(
        conversationId: chatRoleEntity.id,
        chatOpenAiId: chatOpenAiId,
        sendId: UserStore.to.userId,
        recevieId: chatRoleEntity.id,
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
  String type;
  String lastSender;
  String lastSenderAvatar;
  String lastSendTime;
  String content;
  String? draf;
  int unread = 0;
  ConversationLast({
    required this.conversationId,
    required this.lastSender,
    required this.lastSenderAvatar,
    required this.lastSendTime,
    required this.content,
    required this.type,
    this.draf,
  });
  factory ConversationLast.fromJson(Map<String, dynamic> json) => ConversationLast(
        conversationId: json["conversationId"],
        type: json["type"] ?? ChatRoleEnum.user.name,
        lastSender: json["lastSender"],
        lastSenderAvatar: json["lastSenderAvatar"],
        lastSendTime: json["lastSendTime"],
        content: json["content"],
        draf: json["draf"],
      );
  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "type": type,
        "lastSender": lastSender,
        "lastSenderAvatar": lastSenderAvatar,
        "lastSendTime": lastSendTime,
        "content": content,
        "draf": draf,
      };
}
