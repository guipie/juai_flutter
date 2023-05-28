// To parse this JSON data, do
//
//     final noticeSettingRes = noticeSettingResFromJson(jsonString);

import 'dart:convert';
// To parse this JSON data, do
//
//     final noticesRes = noticesResFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class NoticesRes {
  String title;
  String description;
  String? content;
  String createTime;
  int id;

  NoticesRes({
    required this.title,
    required this.description,
    this.content,
    required this.createTime,
    required this.id,
  });

  factory NoticesRes.fromRawJson(String str) => NoticesRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoticesRes.fromJson(Map<String, dynamic> json) => NoticesRes(
        title: json["Title"],
        description: json["Description"],
        content: json["Content"],
        createTime: json["CreateTime"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "Content": content,
        "CreateTime": createTime,
        "Id": id,
      };
}

class NoticeSettingRes {
  bool isAllowNotice;
  String noticeType; //vibration,ring

  NoticeSettingRes({
    required this.isAllowNotice,
    required this.noticeType,
  });

  factory NoticeSettingRes.fromRawJson(String str) => NoticeSettingRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoticeSettingRes.fromJson(Map<String, dynamic> json) => NoticeSettingRes(
        isAllowNotice: json["IsAllowNotice"],
        noticeType: json["NoticeType"],
      );

  Map<String, dynamic> toJson() => {
        "IsAllowNotice": isAllowNotice,
        "NoticeType": noticeType,
      };
}
