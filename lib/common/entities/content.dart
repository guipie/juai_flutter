// To parse this JSON data, do
//
//     final contentReqEntity = contentReqEntityFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';

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
  int payTokens = 0;
  BaReadType readType = BaReadType.Pub;
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
        "PayTokens": payTokens,
        "readType": readType.name,
      };
}

/// 内容列表 response
ContentResEntity contentResEntityFromJson(String str) => ContentResEntity.fromJson(json.decode(str));
String contentResEntityToJson(ContentResEntity data) => json.encode(data.toJson());

/// 内容列表 response
class ContentResEntity {
  String title;
  String summary;
  String? tags;
  BaCategory category;
  BaReadType readType;
  int id;
  int createId;
  String? createNick;
  String? avatar;
  DateTime createTime;
  List<dynamic> files;

  ContentResEntity({
    required this.title,
    required this.summary,
    this.tags,
    required this.category,
    required this.readType,
    required this.id,
    required this.createId,
    this.createNick,
    this.avatar,
    required this.createTime,
    required this.files,
  });

  factory ContentResEntity.fromJson(Map<String, dynamic> vjson) => ContentResEntity(
        title: vjson["Title"],
        summary: vjson["Summary"],
        tags: vjson["Tags"],
        category: BaCategory.values.firstWhereOrNull((element) => element.name == vjson["Category"]) ?? BaCategory.Text,
        readType: BaReadType.values.firstWhereOrNull((element) => element.name == vjson["ReadType"]) ?? BaReadType.Pub,
        id: vjson["Id"],
        createId: vjson["CreateId"],
        createNick: vjson["CreateNick"],
        avatar: vjson["Avatar"],
        createTime: DateTime.parse(vjson["CreateTime"]),
        files: vjson["Files"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Summary": summary,
        "Tags": tags,
        "Category": category,
        "Type": readType.name,
        "Id": id,
        "CreateId": createId,
        "CreateNick": createNick,
        "Avatar": avatar,
        "CreateTime": "${createTime.year.toString().padLeft(4, '0')}-${createTime.month.toString().padLeft(2, '0')}-${createTime.day.toString().padLeft(2, '0')}",
        "Files": files,
      };
}
