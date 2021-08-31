import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../mock/home_screen_response.dart';

void main() {
  final mockDioProvider = Dio();
  final mockDioAdapter = DioAdapter(dio: mockDioProvider);
  const pathGetAllShoes = '${API_URL_SHOE_SERVICE}/shoe';
  const pathGetShoesByKeyword = '${API_URL_SHOE_SERVICE}/shoe?name=i';
  const pathGetShoeDetail =
      '${API_URL_SHOE_SERVICE}/shoe/9b8e726f-1ec7-453f-9da5-c4356597d618';
  mockDioProvider.httpClientAdapter = mockDioAdapter;
  //
  test('ShoeService - getAllShoes - Success', () async {
    mockDioAdapter.onGet(
        pathGetAllShoes, (request) => request.reply(200, dummyShoeListResApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(shoeServiceProvider);
    List<ShoeList> shoeList = await service.getAllShoes();
    expect(shoeList.length, Success(dummyShoeList).data!.length);
  });

  test('ShoeService - getShoesByKeyword - Success', () async {
    mockDioAdapter.onGet(pathGetShoesByKeyword,
        (request) => request.reply(200, dummyShoeListByKeywordResApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(shoeServiceProvider);
    List<ShoeList> shoeList = await service.getShoesByKeyword("i");
    expect(shoeList.length, Success(dummyShoeListByKeyword).data!.length);
  });

  test('ShoeService - getShoeDetail - Success', () async {
    mockDioAdapter.onGet(
        pathGetShoeDetail, (request) => request.reply(200, dummyShoeDetailResApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(shoeServiceProvider);
    ShoeDetail shoeList =
        await service.getShoeDetail("9b8e726f-1ec7-453f-9da5-c4356597d618");
    expect(shoeList.shoeItem.length, Success(dummyShoeDetailResApi).data!.length);
  });
}
