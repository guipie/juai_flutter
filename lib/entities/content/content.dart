// To parse this JSON data, do
//
//     final contentReqEntity = contentReqEntityFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:juai/common/utils/base_page/base_page_state.dart';

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
  int? specialId;
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
        "ReadType": readType.name,
        "SpecialId": specialId,
      };
}

/// 内容列表 response
ContentResEntity contentResEntityFromJson(String str) => ContentResEntity.fromJson(json.decode(str));
String contentResEntityToJson(ContentResEntity data) => json.encode(data.toJson());

/// 内容列表 response
class ContentResEntity extends PagingStateBase {
  String title;
  String summary;
  String content;
  String? tags;
  BaCategory category;
  BaReadType readType;
  int createId;
  String? createNick;
  String? avatar;
  DateTime createTime;
  bool? isLiked;
  int likeNum;
  bool? isCommented;
  int commentNum;
  int? specialId;
  String? specialName;
  List<dynamic> files;

  ContentResEntity({
    required int id,
    required this.title,
    required this.summary,
    required this.content,
    this.tags,
    required this.category,
    required this.readType,
    required this.createId,
    this.createNick,
    this.avatar,
    required this.createTime,
    required this.files,
    required this.commentNum,
    required this.likeNum,
    this.isLiked,
    this.specialId,
    this.specialName,
    this.isCommented,
  }) : super(id);

  factory ContentResEntity.fromJson(Map<String, dynamic> vjson) => ContentResEntity(
        title: vjson["Title"],
        summary: vjson["Summary"],
        content: vjson["Content"],
        tags: vjson["Tags"],
        category: BaCategory.values.firstWhereOrNull((element) => element.name == vjson["Category"]) ?? BaCategory.Text,
        readType: BaReadType.values.firstWhereOrNull((element) => element.name == vjson["ReadType"]) ?? BaReadType.Pub,
        id: vjson["Id"],
        createId: vjson["CreateId"],
        createNick: vjson["CreateNick"] ?? ("---" + vjson["CreateId"].toString()),
        avatar: vjson["Avatar"],
        createTime: DateTime.parse(vjson["CreateTime"]),
        files: vjson["Files"] ?? [],
        isLiked: vjson["IsLiked"],
        isCommented: vjson["IsCommented"],
        commentNum: vjson["CommentNum"],
        likeNum: vjson["LikeNum"],
        specialId: vjson["SpecialId"],
        specialName: vjson["SpecialName"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Summary": summary,
        "Cummary": content,
        "Tags": tags,
        "Category": category,
        "Type": readType.name,
        "Id": id,
        "CreateId": createId,
        "CreateNick": createNick,
        "Avatar": avatar,
        "CreateTime": "${createTime.year.toString().padLeft(4, '0')}-${createTime.month.toString().padLeft(2, '0')}-${createTime.day.toString().padLeft(2, '0')}",
        "Files": files,
        "LikeNum": likeNum,
        "CommentNum": commentNum,
        "IsLiked": isLiked,
        "IsCommented": isCommented,
        "SpecialId": specialId,
        "SpecialName": specialName,
      };
}
