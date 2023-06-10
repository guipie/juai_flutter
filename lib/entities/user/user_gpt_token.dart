// To parse this JSON data, do
//
//     final gptTokenEntity = gptTokenEntityFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class GptTokenEntity {
  int count;
  int contextType; //0不保持上下文，-1保持全部上下文，其他保持当前会话个数的上下文
  DateTime lastUseDate;

  GptTokenEntity({
    required this.count,
    required this.contextType,
    required this.lastUseDate,
  });

  factory GptTokenEntity.fromRawJson(String str) => GptTokenEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GptTokenEntity.fromJson(Map<String, dynamic> json) => GptTokenEntity(
        count: json["Count"],
        contextType: json["ContextType"],
        lastUseDate: DateTime.parse(json["LastUseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Count": count,
        "ContextType": contextType,
        "LastUseDate": lastUseDate.toIso8601String(),
      };
}
