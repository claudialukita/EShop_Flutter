import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/home/home_screen.dart';
import 'package:eshop_flutter/login/login_screen.dart';
import 'package:eshop_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:integration_test/integration_test.dart';

import 'mock/home_screen_reponse.dart';
import 'mock/login_response.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('login screen test', () {
    testWidgets('login screen success test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const path = '${API_URL}sign-in-by-email';
      const mockedEmail = "test@gmail.com";
      const mockedPassword = "test123";

      LoginModel login = new LoginModel(mockedEmail, mockedPassword);

      dioAdapter.onPost(
          path, (server) => server.reply(200, mockedLoginResponse),
          data: login.toJson());

      runApp(ProviderScope(
          overrides: [dioProvider.overrideWithValue(mockDioProvider)],
          child: MyApp()));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(Key("sign_in_form_text_input_email")), mockedEmail);
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(Key("sign_in_form_text_input_password")), mockedPassword);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ElevatedButton, "Sign In"));
      await tester.pumpAndSettle();
      // await tester.tap(find.widgetWithText(ElevatedButton, "Sign In"));
      // await tester.pumpAndSettle(Duration(milliseconds: 100000));
      expect(find.byType(HomeScreen), findsOneWidget);

    });

    testWidgets('login screen error test', (WidgetTester tester) async {

      runApp(ProviderScope(child: MyApp()));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.widgetWithText(ElevatedButton, "Sign In"));
      await tester.pumpAndSettle(Duration(milliseconds: 30000));
      expect(find.byType(Login), findsOneWidget);

    });

    // testWidgets('home screen success test', (WidgetTester tester) async {
    //   final mockDioProvider = Dio(BaseOptions());
    //   final dioAdapter = DioAdapter(dio: mockDioProvider);
    //   const keyword = 'pum';
    //   const path = '${API_URL_SHOE_SERVICE}/shoe?name=${keyword}';
    //   const mockedEmail = "test@gmail.com";
    //   const mockedPassword = "myPassword";
    //   const mockedId = "nikeAF1-001";
    //   const mockedName = "nike air force 1";
    //   const mockedRating = 4;
    //   const mockedPrice = 123123.00;
    //   const mockedImageUrls = ["url1", "url2"];
    //
    //   ShoeList shoeList = new ShoeList(
    //       mockedId, mockedName, mockedRating, mockedPrice, mockedImageUrls);
    //   List<ShoeList> response =
    //       new dioAdapter.onGet(path, (server) => server.reply(200, data));
    // });
  });
}
