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
