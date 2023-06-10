import 'dart:developer';

import 'package:dio/dio.dart';

class LogInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('''
        ---RESPONSE---
        Uri ${response.realUri}
        Data: ${response.data}
        Headers: ${response.headers}
    ''');
    handler.next(response);
  }
}
