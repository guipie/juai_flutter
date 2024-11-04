import 'package:chat_bot/models/api_res.dart';

import 'http.dart';

/// 调用底层的request，重新提供get，post等方便方法
/// https://juejin.cn/post/7366054366326194228#heading-16

class Api {
  static Http httpRequest = Http();

  /// get
  static Future<ApiRes<T>> get<T>(
    String path, {
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    bool showLoading = true, //加载过程
    bool showErrorMessage = true, //返回数据
    Function(Map<String, dynamic>)? fromJsonT,
  }) async {
    return await httpRequest.request<T>(path: path, method: HttpMethod.get, data: data, queryParameters: queryParameters, showLoading: showLoading, showErrorMessage: showErrorMessage, fromJsonT: fromJsonT);
  }

  /// post
  static Future post({
    required String path,
    required HttpMethod method,
    dynamic data,
    bool showLoading = true,
    bool showErrorMessage = true,
  }) {
    return httpRequest.request(
      path: path,
      method: HttpMethod.post,
      data: data,
      showLoading: showLoading,
      showErrorMessage: showErrorMessage,
    );
  }
}
