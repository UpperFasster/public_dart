import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_court/core/services/services.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final userStateService = getIt<UserStateService>();
    final accessToken = userStateService.user?.token;

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    log('Request made to: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Response received from: ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Response received from: ${err.message}');
    super.onError(err, handler);
  }
}
