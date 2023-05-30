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
