import 'package:juai/entities/user/user_base.dart';
import 'package:get/get.dart';
import 'package:juai/entities/api_response.dart';
import 'package:juai/entities/user/user_login.dart';
import 'package:juai/common/utils/http.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<ApiResponse> login(
    UserLoginRequestEntity params,
  ) async {
    return await HttpUtil().post(
      '/api/app/user/login',
      data: params.toJson(),
      isLoading: true,
    );
  }

  static Future<ApiResponse> replaceToken() async {
    return await HttpUtil().post('/api/app/user/replaceToken');
  }

  static Future<UserInfo> getUserInfo(int userId) async {
    return HttpUtil().get('/api/app/user/$userId').then((value) => UserInfo.fromJson(value.data));
  }

  static Future<ApiResponse> sendVcode(String phoneNum) async {
    return await HttpUtil().post('/api/app/common/sms/vcode/' + phoneNum).catchError((e) => ApiResponse(status: 0, message: "出错" + e, isOk: false), test: (Object o) => true);
  }

  static Future<ApiResponse> resetPwd(UserLoginRequestEntity userInfo) async {
    return await HttpUtil()
        .post(
          '/api/app/user/reset/password',
          data: userInfo.toJson(),
          isLoading: true,
        )
        .catchError(
          (e) => ApiResponse(status: 0, message: "出错" + e, isOk: false),
        );
  }

  static Future<ApiResponse> resetPhoneBefore(PhoneUpdateReq req) async {
    return await HttpUtil()
        .post(
          '/api/app/user/reset/phone/validate',
          data: req.toJson(),
          isLoading: true,
        )
        .catchError(
          (e) => ApiResponse(status: 0, message: "出错" + e, isOk: false),
        );
  }

  static Future<ApiResponse> resetPhone(PhoneUpdateReq req) async {
    return await HttpUtil()
        .post(
          '/api/app/user/reset/phone',
          data: req.toJson(),
          isLoading: true,
        )
        .catchError(
          (e) => ApiResponse(status: 0, message: "出错" + e, isOk: false),
        );
  }

  static Future<ApiResponse> userUpdate(Map<dynamic, dynamic> userInfo) async {
    return await HttpUtil()
        .post(
          '/api/app/user/update',
          data: userInfo,
          isLoading: true,
        )
        .catchError(
          (e) => ApiResponse(status: 0, message: "出错" + e, isOk: false),
        );
  }

  /// Logout
  static Future logout() async {
    return await HttpUtil().post(
      '/user/logout',
    );
  }
}
