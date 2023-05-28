import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/utils/date.dart';

class Conversation {
  Conversation({
    this.id,
    required this.conversationId,
    required this.chatId,
    required this.sender,
    required this.recevier,
    required this.senderAvatar,
    required this.receiverAvatar,
    required this.sendTime,
    required this.receiveTime,
    required this.content,
  });
  int? id;
  String conversationId;
  String chatId;
  String sender;
  String recevier;
  String senderAvatar;
  String receiverAvatar;
  String sendTime;
  String? receiveTime;
  String content;
  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        conversationId: json["conversationId"],
        chatId: json["chatId"],
        sender: json["sender"],
        recevier: json["recevier"],
        senderAvatar: json["senderAvatar"],
        receiverAvatar: json["receiverAvatar"],
        sendTime: json["sendTime"],
        receiveTime: json["receiveTime"],
        content: json["content"],
      );
  factory Conversation.fromJsonFromMine(String conversationId, String chatId, String content, {String? sendTime, String? receiveTime}) => Conversation(
        conversationId: conversationId,
        chatId: chatId,
        sender: "自己",
        recevier: "机器人",
        senderAvatar: Assets.defaultAvatar,
        receiverAvatar: Assets.robotAvatar,
        sendTime: sendTime ?? dateFormatYMDHMS(DateTime.now()),
        receiveTime: receiveTime ?? dateFormatYMDHMS(DateTime.now()),
        content: content,
      );
  factory Conversation.fromJsonFromChatGPT(String conversationId, String chatId, String content, {String? sendTime, String? receiveTime}) => Conversation(
        conversationId: conversationId,
        chatId: chatId,
        sender: "机器人",
        recevier: "自己",
        senderAvatar: Assets.robotAvatar,
        receiverAvatar: Assets.defaultAvatar,
        sendTime: sendTime ?? dateFormatYMDHMS(DateTime.now()),
        receiveTime: receiveTime ?? dateFormatYMDHMS(DateTime.now()),
        content: content,
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "conversationId": conversationId,
        "chatId": chatId,
        "sender": sender,
        "recevier": recevier,
        "senderAvatar": senderAvatar,
        "receiverAvatar": receiverAvatar,
        "sendTime": sendTime,
        "receiveTime": receiveTime,
        "content": content,
      };
}

class ConversationLast extends Conversation {
  String? draft;
  ConversationLast({this.draft, required super.conversationId, required super.chatId, required super.sender, required super.recevier, required super.senderAvatar, required super.receiverAvatar, required super.sendTime, required super.receiveTime, required super.content});

  factory ConversationLast.fromJson(Map<String, dynamic> json) => ConversationLast(
        draft: json["draft"],
        conversationId: json["conversationId"],
        chatId: json["chatId"],
        sender: json["sender"],
        recevier: json["recevier"],
        senderAvatar: json["senderAvatar"],
        receiverAvatar: json["receiverAvatar"],
        sendTime: json["sendTime"],
        receiveTime: json["receiveTime"],
        content: json["content"],
      );
}
