// To parse this JSON data, do
//
//     final chatMessageEntity = chatMessageEntityFromJson(jsonString);

import 'dart:convert';

class ChatMessageEntity {
  String content;
  int sendId;
  String sendNick;
  String? sendAvatar;
  DateTime sendTime;

  ChatMessageEntity({
    required this.content,
    required this.sendId,
    required this.sendNick,
    this.sendAvatar,
    required this.sendTime,
  });

  factory ChatMessageEntity.fromRawJson(String str) => ChatMessageEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) => ChatMessageEntity(
        content: json["Content"],
        sendId: json["SendId"],
        sendNick: json["SendNick"] ?? "管理员",
        sendAvatar: json["SendAvatar"],
        sendTime: DateTime.parse(json["SendTime"]),
      );

  Map<String, dynamic> toJson() => {
        "Content": content,
        "SendId": sendId,
        "SendNick": sendNick,
        "SendAvatar": sendAvatar,
        "SendTime": sendTime.toIso8601String(),
      };
}
