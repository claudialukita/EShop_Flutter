import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../mock/login_screen_response.dart';

void main() {
  final mockDioProvider = Dio();
  final mockDioAdapter = DioAdapter(dio: mockDioProvider);
  const pathLogin = '${API_URL}sign-in-by-email';

  mockDioProvider.httpClientAdapter = mockDioAdapter;
  //
  test('Login Service Success Test', () async {
    mockDioAdapter.onPost(
        pathLogin, (request) => request.reply(200, dummyLoginResponseApi), data: dummyLogin.toJson());

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(loginServiceProvider);
    LoginResponse response = await service.getLogin(dummyLogin.email, dummyLogin.password);
    expect(response.message, Success(dummyLoginResponse).data?.message);
  });

  test('Login Service Error Test', () async {
    mockDioAdapter.onGet(
      pathLogin,
          (request) => request.reply(400, {'message': 'Error'}),
    );
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(mockDioProvider)],
    );
    final service = container.read(loginServiceProvider);
    expect(service.getLogin("", ""), throwsException);
  });
}