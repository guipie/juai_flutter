import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../base.dart';
import 'api_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    /// 根据DioError创建HttpException
    var httpException = ApiException.from(err);

    /// dio默认的错误实例，如果是没有网络，只能得到一个未知错误，无法精准的得知是否是无网络的情况
    /// 这里对于断网的情况，给一个特殊的code和msg
    if (err.type == DioExceptionType.connectionError) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        httpException = ApiException(-100, 'None Network.');
      }
    }

    /// 将自定义的HttpException
    // err.err = httpException;
    httpException.e();

    /// 调用父类，回到dio框架
    // super.onError(
    //     DioException(
    //       requestOptions: err.requestOptions,
    //       response: err.response,
    //       error: httpException,
    //       type: err.type,
    //       message: httpException.message,
    //       stackTrace: err.stackTrace,
    //     ),
    //     handler);
    handler.reject(DioException(requestOptions: err.requestOptions, response: err.response, error: httpException, type: err.type, message: httpException.message, stackTrace: err.stackTrace));
  }
}

//
class HttpException implements Exception {
  final int code;
  final String msg;

  HttpException({
    this.code = -1,
    this.msg = 'unknow error',
  });

  @override
  String toString() {
    return 'Http Error [$code]: $msg';
  }

  factory HttpException.create(DioException error) {
    /// dio异常
    switch (error.type) {
      case DioExceptionType.cancel:
        {
          return HttpException(code: -1, msg: 'request cancel');
        }
      case DioExceptionType.connectionTimeout:
        {
          return HttpException(code: -1, msg: 'connect timeout');
        }
      case DioExceptionType.sendTimeout:
        {
          return HttpException(code: -1, msg: 'send timeout');
        }
      case DioExceptionType.receiveTimeout:
        {
          return HttpException(code: -1, msg: 'receive timeout');
        }
      case DioExceptionType.badResponse:
        {
          try {
            var statusCode = error.response?.statusCode ?? 0;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (statusCode) {
              case 400:
                {
                  return HttpException(code: statusCode, msg: 'Request syntax error');
                }
              case 401:
                {
                  return HttpException(code: statusCode, msg: 'Without permission');
                }
              case 403:
                {
                  return HttpException(code: statusCode, msg: 'Server rejects execution');
                }
              case 404:
                {
                  return HttpException(code: statusCode, msg: 'Unable to connect to server');
                }
              case 405:
                {
                  return HttpException(code: statusCode, msg: 'The request method is disabled');
                }
              case 500:
                {
                  return HttpException(code: statusCode, msg: 'Server internal error');
                }
              case 502:
                {
                  return HttpException(code: statusCode, msg: 'Invalid request');
                }
              case 503:
                {
                  return HttpException(code: statusCode, msg: 'The server is down.');
                }
              case 505:
                {
                  return HttpException(code: statusCode, msg: 'HTTP requests are not supported');
                }
              default:
                {
                  return HttpException(code: statusCode, msg: error.response?.statusMessage ?? 'unknow error');
                }
            }
          } on Exception catch (_) {
            return HttpException(code: -1, msg: 'unknow error');
          }
        }
      default:
        {
          return HttpException(code: -1, msg: error.message ?? 'unknow error');
        }
    }
  }
}
