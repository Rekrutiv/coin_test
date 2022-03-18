import 'dart:io';

import 'package:dio/dio.dart';

import '../../../main.dart';

class HttpInterceptor {
  HttpInterceptor() {
    final dio = injector.get<Dio>();

    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers.addAll({
        HttpHeaders.authorizationHeader:
            "9A2F88EB-DC4C-444C-8C6C-7C172F79C4D7"
      });

      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      return handler.next(e);
    }));
  }
}
