/*
 * Http的缓存策略与处理
 */
import 'package:dio/dio.dart';

import '../../../base/base.dart';
import '../../../components/mouse_hover_item.dart';

class CacheInterceptor extends Interceptor {
  final _cache = <Uri, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final response = _cache[options.uri];
    if (response != null && response.data != null && response.data['code'] == 200) {
      // 如果缓存中存在响应，则直接返回缓存的响应
      handler.resolve(response);
    } else {
      // 否则，继续发送请求
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 将返回的响应存储到缓存中
    _cache[response.requestOptions.uri] = response;
    handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    '缓存出错了'.e();
    super.onError(err, handler);
  }
}
