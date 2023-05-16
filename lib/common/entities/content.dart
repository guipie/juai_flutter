// To parse this JSON data, do
//
//     final contentReqEntity = contentReqEntityFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

enum BaCategory { Text, Image, Video, Article }

enum BaReadType { Pub, Pri, Pay }

String contentReqEntityToJson(ContentAddReqEntity data) => json.encode(data.toJson());

///添加内容
class ContentAddReqEntity {
  late String title;
  late String summary;
  late String content;
  String? tags;
  late BaCategory category;
  List<int>? fileIds;
  ContentAddReqEntity() {
    title = summary = tags = content = "";
    category = BaCategory.Text;
  }
  Map<String, dynamic> toJson() => {
        "Title": title,
        "Summary": summary,
        "Content": content,
        "Tags": tags,
        "Category": category.name,
        "FileIds": fileIds,
      };
}

/// 内容列表 response
ContentResEntity contentResEntityFromJson(String str) => ContentResEntity.fromJson(json.decode(str));
String contentResEntityToJson(ContentResEntity data) => json.encode(data.toJson());

/// 内容列表 response
class ContentResEntity {
  String title;
  String summary;
  String content;
  String tags;
  int category;
  int type;
  int id;
  int createId;
  String createNick;
  String avatar;
  DateTime createTime;

  ContentResEntity({
    required this.title,
    required this.summary,
    required this.content,
    required this.tags,
    required this.category,
    required this.type,
    required this.id,
    required this.createId,
    required this.createNick,
    required this.avatar,
    required this.createTime,
  });

  factory ContentResEntity.fromJson(Map<String, dynamic> json) => ContentResEntity(
        title: json["Title"],
        summary: json["Summary"],
        content: json["Content"],
        tags: json["Tags"],
        category: json["Category"],
        type: json["Type"],
        id: json["Id"],
        createId: json["CreateId"],
        createNick: json["CreateNick"],
        avatar: json["Avatar"],
        createTime: DateTime.parse(json["CreateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Summary": summary,
        "Content": content,
        "Tags": tags,
        "Category": category,
        "Type": type,
        "Id": id,
        "CreateId": createId,
        "CreateNick": createNick,
        "Avatar": avatar,
        "CreateTime": "${createTime.year.toString().padLeft(4, '0')}-${createTime.month.toString().padLeft(2, '0')}-${createTime.day.toString().padLeft(2, '0')}",
      };
}
