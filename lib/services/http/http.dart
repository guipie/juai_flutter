import 'package:chat_bot/constants/config.dart';
import 'package:chat_bot/models/api_res.dart';
import 'package:chat_bot/services/http/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor.dart';

class HttpOptions {
  //地址域名前缀
  static const String baseUrl = '';
  //单位时间是ms
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const Duration sendTimeout = Duration(seconds: 10);
}

class Http {
  // 单例模式使用Http类，
  static final Http _instance = Http._internal();

  factory Http() => _instance;

  static late final Dio _dio;

  /// 内部构造方法
  Http._internal() {
    /// 初始化dio
    BaseOptions options = BaseOptions(connectTimeout: HttpOptions.connectTimeout, receiveTimeout: HttpOptions.receiveTimeout, sendTimeout: HttpOptions.sendTimeout, baseUrl: Config.baseApiUrl);

    _dio = Dio(options);

    /// 添加各种拦截器
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, responseBody: true));
  }

  /// 封装request方法
  Future request<T>({
    required String path, //接口地址
    required HttpMethod method, //请求方式
    dynamic data, //数据
    Map<String, dynamic>? queryParameters,
    bool showLoading = true, //加载过程
    bool showErrorMessage = true, //返回数据
    Function(Object)? fromJsonT,
  }) async {
    const Map methodValues = {HttpMethod.get: 'get', HttpMethod.post: 'post', HttpMethod.put: 'put', HttpMethod.delete: 'delete', HttpMethod.patch: 'patch', HttpMethod.head: 'head'};

    //动态添加header头
    Map<String, dynamic> headers = <String, dynamic>{};
    headers["version"] = "1.0.0";

    Options options = Options(
      method: methodValues[method],
      headers: headers,
    );

    try {
      if (showLoading) {
        //EasyLoading.show(status: 'loading...');
      }
      Response response = await Http._dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      // // 如果没有设置fromJsonT或者R是dynamic类型，直接返回响应数据
      // if (fromJsonT == null || T == dynamic || response.data is! Map<String, dynamic>) ;
      Map<String, dynamic>? responseObject = response.data;
      if (response.statusCode == 200 && responseObject != null && responseObject.isEmpty == false) {
        switch (responseObject['code']) {
          case 200:
            {
              var result = responseObject['result'];
              var apiRes = ApiRes<T>.fromJson(responseObject);
              if (result is List) {
                apiRes.result = (result).map((item) => fromJsonT!(item)).toList() as T;
              } else if (result is Map) {
                apiRes.result = fromJsonT!(result);
              } else {
                apiRes.result = result;
              }
              return apiRes;
            }
          case 105:
            throw NeedLoginException(-1, "需要登录");
          case 219:
            throw NeedLoginException(-1, "应用需要强更");
          default:
            throw ApiException(responseObject['errorCode'], responseObject['errorMsg']);
        }
      } else {
        throw ApiException(-1, "错误响应格式");
      }
    } on DioException catch (error) {
      var exception = ApiException.from(error);
      throw exception;
    }
  }
}

enum HttpMethod {
  get,
  post,
  delete,
  put,
  patch,
  head,
}
