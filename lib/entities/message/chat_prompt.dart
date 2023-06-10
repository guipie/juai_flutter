// To parse this JSON data, do
//
//     final chatPromptEntity = chatPromptEntityFromJson(jsonString);

import 'dart:convert';

import 'package:JuAI/common/assets.dart';

enum ChatPromptRoleEnum { system, user, assistant, chat }
// To parse this JSON data, do
//
//     final chatPromptEntity = chatPromptEntityFromJson(jsonString);

class ChatPromptEntity {
  int id;
  String avatar;
  String type;
  String title;
  List<Prompt> prompts;

  ChatPromptEntity({
    required this.id,
    required this.avatar,
    required this.type,
    required this.title,
    required this.prompts,
  });

  factory ChatPromptEntity.fromRawJson(String str) => ChatPromptEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatPromptEntity.fromJson(Map<String, dynamic> json) => ChatPromptEntity(
        id: json["Id"],
        avatar: json["Avatar"] ?? Assets.robotAvatar,
        type: json["Type"] ?? "JUAI",
        title: json["Title"],
        prompts: json["Prompts"] == null ? [] : List<Prompt>.from(json["Prompts"].map((x) => Prompt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Avatar": avatar,
        "Type": type,
        "Title": title,
        "Prompts": List<dynamic>.from(prompts.map((x) => x.toJson())),
      };
}

class Prompt {
  String role;
  String prompt;

  Prompt({
    required this.role,
    required this.prompt,
  });

  factory Prompt.fromRawJson(String str) => Prompt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prompt.fromJson(Map<String, dynamic> json) => Prompt(
        role: json["Role"] ?? ChatPromptRoleEnum.assistant.name,
        prompt: json["Prompt"],
      );

  Map<String, dynamic> toJson() => {
        "Role": role,
        "Prompt": prompt,
      };
}
