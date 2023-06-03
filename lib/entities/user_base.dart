// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);
import 'dart:convert';
import 'dart:math';

class UserInfo {
  String? avatar;
  String nickName;
  String userName;
  int id;
  int userId;

  UserInfo({
    this.avatar,
    required this.nickName,
    required this.id,
    required this.userId,
    required this.userName,
  });

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        avatar: json["Avatar"],
        nickName: json["NickName"] ?? "用户" + Random().nextInt(1000).toString(),
        id: json["Id"],
        userId: json["UserId"],
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "Avatar": avatar,
        "NickName": nickName,
        "Id": id,
        "UserName": userName,
      };
}

class UserFollowHome {
  String? avatar;
  String nickName;
  DateTime? createTime;
  int id;
  int followedNum;
  int toBeFollowedNum;
  List<dynamic>? tag;
  String? remark;

  UserFollowHome({
    this.avatar,
    required this.nickName,
    required this.id,
    required this.followedNum,
    required this.toBeFollowedNum,
    this.createTime,
    this.tag,
    this.remark,
  });

  factory UserFollowHome.fromJson(Map<String, dynamic> json) => UserFollowHome(
        avatar: json["Avatar"],
        nickName: json["NickName"] ?? "匿名用户",
        id: json["Id"],
        followedNum: json["FollowedNum"],
        toBeFollowedNum: json["ToBeFollowedNum"],
        tag: json["Tag"],
        remark: json["Remark"],
        createTime: DateTime.tryParse(json["CreateTime"]),
      );
}
