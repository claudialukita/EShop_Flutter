import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../mock/order_screen_response.dart';

void main() {
  final mockDioProvider = Dio();
  final mockDioAdapter = DioAdapter(dio: mockDioProvider);
  const pathOrder = '${API_URL_ORDER}orders';
  const pathOrderDetails = '${API_URL_ORDER}orders/510fd0f3-a21e-41de-a23a-82a55b41e739';

  mockDioProvider.httpClientAdapter = mockDioAdapter;
  //
  test('Order Service Success Test', () async {
    mockDioAdapter.onGet(
        pathOrder, (request) => request.reply(200, dummyOrderListApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(orderServiceProvider);
    List<OrderList> response = await service.getOrders();
    expect(response.length, Success(dummyOrderList).data!.length);
  });

  test('Order Service Error Test', () async {
    mockDioAdapter.onGet(
      pathOrder,
          (request) => request.reply(400, {'message': 'Error'}),
    );
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(mockDioProvider)],
    );
    final service = container.read(orderServiceProvider);
    expect(service.getOrders(), throwsException);
  });

  test('Order Detail Service Success Test', () async {
    mockDioAdapter.onGet(
        pathOrderDetails, (request) => request.reply(200, dummyOrderDetailApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(orderServiceProvider);
    Order response = await service.getDetailOrder('510fd0f3-a21e-41de-a23a-82a55b41e739');
    expect(response.id, Success(dummyOrderDetail).data!.id);
  });

  test('Order Detail Service Error Test', () async {
    mockDioAdapter.onGet(
      pathOrderDetails,
          (request) => request.reply(400, {'message': 'Error'}),
    );
    final container = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(mockDioProvider)],
    );
    final service = container.read(orderServiceProvider);
    expect(service.getDetailOrder('510fd0f3-a21e-41de-a23a-82a55b41e739'), throwsException);
  });

}