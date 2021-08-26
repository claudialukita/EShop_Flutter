import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = AppDio.getInstance(ref);
  ref.onDispose(() {
    dio.close();
  });
  return dio;
});

class AppDio with DioMixin implements Dio {
  final ProviderReference ref;

  AppDio._(this.ref, [BaseOptions? options]) {
    options = BaseOptions(
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    this
        .interceptors
        .add(InterceptorsWrapper(onRequest: (requestOptions, handler) {
          var token =
              'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZWYxZDRjMy05Y2QwLTQ4YTYtOTgxYy0wMDE0OGM4MzliYzAiLCJnaXZlbl9uYW1lIjoiQnJ1Y2UiLCJmYW1pbHlfbmFtZSI6IkxlZSIsIm5iZiI6MTYyOTg3NDYzMCwiZXhwIjoxNjYwOTc4NjMwLCJpc3MiOiJFY29tTWluaVByb2plY3RTaG9lcy5Vc2VyU2VydmljZSIsImF1ZCI6IkVjb21NaW5pUHJvamVjdFNob2VzLkFjY2Vzc1Rva2VuSGFuZGxlciJ9.TGPqwHRHqB2uc86Ks5KKgzJNoo7AUmdL4a5graDPqBcddO89djBjC9V8DAKAHtF7z1QqZt0Scjsmg2dvlvtL72vhVrk_H7H6v7-F899IhQsVZ-cteZ0WTBgxqeFB0tgdRLFsS5ERv2dSmwEtynJvBh3gp7FrQE-vG-ovH4hf2X3t9oKV1VstPkQo43FgEYRLsOoO2P2dF2ydu9YH4jsmkyhahNM9O-mMGItEqlfwWEJkwSa1fidOOozwLnhC1p_ejvHBa6oue6WxoRqlUZmsQiB8-h5mAZ5VDxagUkxHC_NejGTUWibDH2NewePTAhsbbUN2QgUuNf_xqIj2unFobg';
          Map tokenHeader = new Map<String, String>();
          if (token != null) {
            tokenHeader['Authorization'] = 'Bearer' + token.toString();
            requestOptions.headers.addAll(tokenHeader as Map<String, dynamic>);
          }

          return handler.next(requestOptions);
        }, onError: (requestOptions, handler) {
          print('Error...');
          return handler.next(requestOptions);
        }, onResponse: (requestOptions, handler) {
          var temp = requestOptions.data;
          requestOptions.data = temp;
          return handler.next(requestOptions);
        }));

    this
        .interceptors
        .add(InterceptorsWrapper(onRequest: (requestOptions, handler) {
          var token =
              'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZWYxZDRjMy05Y2QwLTQ4YTYtOTgxYy0wMDE0OGM4MzliYzAiLCJnaXZlbl9uYW1lIjoiQnJ1Y2UiLCJmYW1pbHlfbmFtZSI6IkxlZSIsIm5iZiI6MTYyOTg3NDYzMCwiZXhwIjoxNjYwOTc4NjMwLCJpc3MiOiJFY29tTWluaVByb2plY3RTaG9lcy5Vc2VyU2VydmljZSIsImF1ZCI6IkVjb21NaW5pUHJvamVjdFNob2VzLkFjY2Vzc1Rva2VuSGFuZGxlciJ9.TGPqwHRHqB2uc86Ks5KKgzJNoo7AUmdL4a5graDPqBcddO89djBjC9V8DAKAHtF7z1QqZt0Scjsmg2dvlvtL72vhVrk_H7H6v7-F899IhQsVZ-cteZ0WTBgxqeFB0tgdRLFsS5ERv2dSmwEtynJvBh3gp7FrQE-vG-ovH4hf2X3t9oKV1VstPkQo43FgEYRLsOoO2P2dF2ydu9YH4jsmkyhahNM9O-mMGItEqlfwWEJkwSa1fidOOozwLnhC1p_ejvHBa6oue6WxoRqlUZmsQiB8-h5mAZ5VDxagUkxHC_NejGTUWibDH2NewePTAhsbbUN2QgUuNf_xqIj2unFobg';

          Map tokenHeader = new Map<String, String>();
          if (token != null) {
            tokenHeader['Authorization'] = 'Bearer ' + token.toString();
            requestOptions.headers.addAll(tokenHeader as Map<String, dynamic>);
          }

          return handler.next(requestOptions);
        }, onError: (requestOptions, handler) {
          print('error woy');
          return handler.next(requestOptions);
        }, onResponse: (requestOptions, handler) {
          var temp = requestOptions.data;
          requestOptions.data = temp;

          return handler.next(requestOptions);
        }));

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance(ProviderReference ref) => AppDio._(ref);
}
