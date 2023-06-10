library apis;

import 'dart:convert';

export '../common/apis/user_api.dart';
export '../common/apis/content_api.dart';

class ApiResponse {
  int? status;
  String? message;
  dynamic data;
  bool isOk;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    required this.isOk,
  });
  factory ApiResponse.fromRawJson(String str) => ApiResponse.fromJson(json.decode(str));
  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
        isOk: json["status"] == 200,
      );
}

class ApiChatResponse {
  int? status;
  String? message;
  dynamic data;
  bool isStop;
  int reqUsegeCnt;
  int resUsegeCnt;
  ApiChatResponse({
    required this.status,
    required this.message,
    this.data,
    required this.isStop,
    required this.reqUsegeCnt,
    required this.resUsegeCnt,
  });
  factory ApiChatResponse.fromRawJson(String str) => ApiChatResponse.fromJson(json.decode(str));
  factory ApiChatResponse.fromJson(Map<String, dynamic> json) => ApiChatResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
        isStop: json["IsStop"] ?? false,
        reqUsegeCnt: json["ReqUsegeCnt"] ?? 0,
        resUsegeCnt: json["ResUsegeCnt"] ?? 0,
      );
}
