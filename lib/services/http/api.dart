import 'dart:convert';

import 'package:dio/dio.dart';

import '../../base.dart';
import '../../models/api_res.dart';

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
    return await httpRequest.request<T, T>(path: path, method: HttpMethod.get, data: data, queryParameters: queryParameters, showLoading: showLoading, showErrorMessage: showErrorMessage, fromJsonT: fromJsonT);
  }

  static Future<ApiRes<T>> post<T>(
    String path, {
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    bool showLoading = true, //加载过程
    bool showErrorMessage = true, //返回数据
    Function(Map<String, dynamic>)? fromJsonT,
    Options? options,
  }) async {
    return await httpRequest.request<T, T>(
      path: path,
      method: HttpMethod.post,
      data: data,
      queryParameters: queryParameters,
      showLoading: showLoading,
      showErrorMessage: showErrorMessage,
      fromJsonT: fromJsonT,
      requestOptions: options,
    );
  }

  static Future<ApiRes<List<T>>> getList<T>(
    String path, {
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    bool showLoading = true, //加载过程
    bool showErrorMessage = true, //返回数据
    Function(Map<String, dynamic>)? fromJsonT,
  }) async {
    return await httpRequest.request<List<T>, T>(path: path, method: HttpMethod.get, data: data, queryParameters: queryParameters, showLoading: showLoading, showErrorMessage: showErrorMessage, fromJsonT: fromJsonT);
  }

  static Future<Response<T>> response<T>(
    String path, {
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isErrorToast = true,
  }) async {
    options ??= Options(method: 'GET');
    options.headers!['version'] = Config.appVersion;
    options.headers!['Authorization'] = SpUtil.getString(CacheKeys.accessToken, prefix: 'Bearer ');
    return httpRequest.responseDio(isErrorToast: isErrorToast).request<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
  }
}
