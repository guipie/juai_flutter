import 'dart:convert';

import 'package:guxin_ai/entities/user_base.dart';

class CommentRes {
  String comment;
  int? replyId;
  int createId;
  String createNick;
  String? avatar;
  String? createTime;
  UserInfo? replyUser;
  CommentRes({
    required this.comment,
    this.replyId,
    this.replyUser,
    required this.createId,
    required this.createNick,
    this.avatar,
    this.createTime,
  });

  factory CommentRes.fromRawJson(String str) => CommentRes.fromJson(json.decode(str));
  factory CommentRes.fromJson(Map<String, dynamic> json) => CommentRes(
        comment: json["Comment"],
        replyId: json["ReplyId"],
        createId: json["CreateId"],
        avatar: json["Avatar"],
        replyUser: json["ReplyUser"] == null ? null : UserInfo.fromJson(json["ReplyUser"]),
        createNick: json["CreateNick"] ?? "火星用户",
        createTime: json["CreateTime"],
      );
}

// To parse this JSON data, do
//
//     final commentReq = commentReqFromJson(jsonString);
class CommentReq {
  String comment;
  int? replyId;
  int contentId;

  CommentReq({
    required this.contentId,
    required this.comment,
    this.replyId,
  });
  Map<String, dynamic> toJson() => {
        "ContentId": contentId,
        "Comment": comment,
        "ReplyId": replyId,
      };
}
