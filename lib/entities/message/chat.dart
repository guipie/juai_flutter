// https://platform.openai.com/docs/api-reference/chat/create
import 'dart:convert';

class ChatMessageEntity {
  String role;
  String content;
  String? name;

  ChatMessageEntity({
    this.role = "system",
    required this.content,
    this.name = "guxin",
  });
  ChatMessageEntity copyWith({
    String? role,
    required String content,
    String? name,
  }) =>
      ChatMessageEntity(role: role ?? this.role, content: content, name: name ?? this.name);

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
        "name": name,
      };
}

class ChatRequestBodyEntity {
  String model = "gpt-3.5-turbo";
  List<ChatMessageEntity> messages;
  double temperature = 1;
  // ignore: non_constant_identifier_names
  double top_p = 1;
  int n = 1;
  bool stream = true;
  ChatRequestBodyEntity({
    required this.messages,
  });
  Map<String, dynamic> toJson() => {
        "model": model,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "top_p": top_p,
        "n": n,
        "stream": stream,
      };
}

ChatResponseEntity chatResponseEntityFromJson(String str) => ChatResponseEntity.fromJson(json.decode(str));

class ChatResponseEntity {
  ChatResponseEntity({
    required this.role,
    required this.id,
    required this.parentMessageId,
    required this.text,
    required this.delta,
    required this.detail,
  });

  String role;
  String id;
  String parentMessageId;
  String text;
  String delta;
  Detail detail;

  factory ChatResponseEntity.fromJson(Map<String, dynamic> json) => ChatResponseEntity(
        role: json["role"],
        id: json["id"],
        parentMessageId: json["parentMessageId"],
        text: json["text"],
        delta: json["delta"],
        detail: Detail.fromJson(json["detail"]),
      );
}

class Detail {
  Detail({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
  });

  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );
}

class Choice {
  Choice({
    required this.delta,
    required this.index,
    this.finishReason,
  });

  Delta delta;
  int index;
  dynamic finishReason;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        delta: Delta.fromJson(json["delta"]),
        index: json["index"],
        finishReason: json["finish_reason"],
      );
}

class Delta {
  Delta({
    required this.content,
  });

  String content;

  factory Delta.fromJson(Map<String, dynamic> json) => Delta(
        content: json["content"],
      );
}
