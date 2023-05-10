import 'package:guxin_ai/common/apis/apis.dart';
import 'package:guxin_ai/common/entities/user.dart';
import 'package:guxin_ai/common/utils/http.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<ApiResponse> login(
    UserLoginRequestEntity params,
  ) async {
    return await HttpUtil().post(
      '/api/app/user/login',
      data: params.toJson(),
    );
  }

  static Future<ApiResponse> sendVcode(String phoneNum) async {
    return await HttpUtil().post('/api/app/common/sms/vcode/' + phoneNum).catchError((e) => ApiResponse(status: 0, message: "出错" + e, isOk: false), test: (Object o) => true);
  }

  /// Logout
  static Future logout() async {
    return await HttpUtil().post(
      '/user/logout',
    );
  }
}
