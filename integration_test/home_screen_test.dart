import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:integration_test/integration_test.dart';

import 'mock/home_screen_reponse.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('home scren test', () {
    testWidgets('home screen success test', (WidgetTester tester) async {
      final mockDioProvider = Dio(BaseOptions());
      final dioAdapter = DioAdapter(dio: mockDioProvider);
      const keyword = 'pum';
      const path = '${API_URL_SHOE_SERVICE}/shoe?name=${keyword}';
      const mockedEmail = "test@gmail.com";
      const mockedPassword = "myPassword";
      const mockedId = "nikeAF1-001";
      const mockedName = "nike air force 1";
      const mockedRating = 4;
      const mockedPrice = 123123.00;
      const mockedImageUrls = ["url1", "url2"];

      dioAdapter.onGet(path, (server) => server.reply(200, mockedShoeListResponse));

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
