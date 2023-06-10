// To parse this JSON data, do
//
//     final chatRoleEntity = chatRoleEntityFromJson(jsonString);
import 'dart:convert';

class ChatRoleEntity_Bak {
  String avatar;
  String name;
  List<Context> context;
  ModelConfig modelConfig;
  String lang;
  bool builtin;
  int id;

  ChatRoleEntity_Bak({
    required this.avatar,
    required this.name,
    required this.context,
    required this.modelConfig,
    required this.lang,
    required this.builtin,
    required this.id,
  });

  factory ChatRoleEntity_Bak.fromRawJson(String str) => ChatRoleEntity_Bak.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatRoleEntity_Bak.fromJson(Map<String, dynamic> json) => ChatRoleEntity_Bak(
        avatar: json["avatar"],
        name: json["name"],
        context: List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
        modelConfig: ModelConfig.fromJson(json["modelConfig"]),
        lang: json["lang"],
        builtin: json["builtin"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "context": List<dynamic>.from(context.map((x) => x.toJson())),
        "modelConfig": modelConfig.toJson(),
        "lang": lang,
        "builtin": builtin,
        "id": id,
      };
}

class Context {
  String role;
  String content;
  String date;

  Context({
    required this.role,
    required this.content,
    required this.date,
  });

  factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        role: json["role"],
        content: json["content"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
        "date": date,
      };
}

class ModelConfig {
  String model;
  double temperature;
  int maxTokens;
  int presencePenalty;
  bool sendMemory;
  int historyMessageCount;
  int compressMessageLengthThreshold;

  ModelConfig({
    required this.model,
    required this.temperature,
    required this.maxTokens,
    required this.presencePenalty,
    required this.sendMemory,
    required this.historyMessageCount,
    required this.compressMessageLengthThreshold,
  });

  factory ModelConfig.fromRawJson(String str) => ModelConfig.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelConfig.fromJson(Map<String, dynamic> json) => ModelConfig(
        model: json["model"],
        temperature: double.tryParse(json["temperature"].toString()) ?? 0.0,
        maxTokens: json["max_tokens"],
        presencePenalty: json["presence_penalty"],
        sendMemory: json["sendMemory"],
        historyMessageCount: json["historyMessageCount"],
        compressMessageLengthThreshold: json["compressMessageLengthThreshold"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "temperature": temperature,
        "max_tokens": maxTokens,
        "presence_penalty": presencePenalty,
        "sendMemory": sendMemory,
        "historyMessageCount": historyMessageCount,
        "compressMessageLengthThreshold": compressMessageLengthThreshold,
      };
}
