import 'dart:convert';

// 登录请求
class UserLoginRequestEntity {
  String userName;
  String? password;
  String? newPassword;
  String? vcode;
  String? u;
  UserLoginRequestEntity({
    required this.userName,
    this.password,
    this.newPassword,
    this.vcode,
    this.u,
  });
  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
        "NewPassword": newPassword,
        "Vcode": vcode,
        "U": u,
      };
}

// 登录返回

class UserLoginResponseEntity {
  int id;
  String userName;
  String nickName;
  String? sex;
  String? birthday;
  String? email;
  String phone;
  String? address;
  String? avatar;
  DateTime lastLoginDate;
  String roleNames;
  String? remark;
  int tokenNum;
  UserLoginResponseEntity({
    required this.id,
    required this.userName,
    required this.nickName,
    this.sex,
    required this.tokenNum,
    this.birthday,
    this.email,
    required this.phone,
    this.address,
    this.avatar,
    required this.lastLoginDate,
    required this.roleNames,
    this.remark,
  });

  factory UserLoginResponseEntity.fromRawJson(String str) => UserLoginResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) => UserLoginResponseEntity(
        id: json["Id"],
        userName: json["UserName"],
        tokenNum: json["TokenNum"] ?? 0,
        nickName: json["NickName"],
        avatar: json["Avatar"],
        sex: json["Sex"],
        birthday: json["Birthday"],
        email: json["Email"],
        phone: json["Phone"] ?? "",
        address: json["Address"],
        lastLoginDate: DateTime.tryParse(json["LastLoginTime"].toString()) ?? DateTime.now(),
        roleNames: json["RoleNames"],
        remark: json["Remark"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserName": userName,
        "TokenNum": tokenNum,
        "NickName": nickName,
        "Sex": sex,
        "Birthday": birthday,
        "Email": email,
        "Phone": phone,
        "Address": address,
        "Avatar": avatar,
        "LastLoginDate": lastLoginDate.toIso8601String(),
        "RoleNames": roleNames,
        "Remark": remark,
      };
}

class UserTokenResponseEntity {
  bool success;
  String token;
  double expiresIn;
  String tokenType;

  UserTokenResponseEntity({
    required this.success,
    required this.token,
    required this.expiresIn,
    required this.tokenType,
  });

  factory UserTokenResponseEntity.fromRawJson(String str) => UserTokenResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserTokenResponseEntity.fromJson(Map<String, dynamic> json) => UserTokenResponseEntity(
        success: json["success"] ?? true,
        token: json["token"],
        expiresIn: json["expires_in"]?.toDouble(),
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "expires_in": expiresIn,
        "token_type": tokenType,
      };
}

class PhoneUpdateReq {
  String? vcode;
  String newPhone;
  String? password;

  PhoneUpdateReq({
    this.vcode,
    required this.newPhone,
    this.password,
  });
  Map<String, dynamic> toJson() => {
        "Vcode": vcode,
        "NewPhone": newPhone,
        "Password": password,
      };
}
