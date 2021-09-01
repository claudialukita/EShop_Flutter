import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:eshop_flutter/order/order_screen.dart';
import 'package:eshop_flutter/order/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/order_screen_response.dart';
import 'order_screen_test.mocks.dart';

@GenerateMocks([OrderService, OrderViewModel])
void main() {
  final mockOrderService = MockOrderService();

  when(mockOrderService.getOrders()).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(seconds: 10), () => Future.value(dummyOrderList)));

  final mockOrderViewModel = MockOrderViewModel();
  when(mockOrderViewModel.loadData()).thenAnswer((realInvocation) => null);

  testWidgets('EShop - Order Screen', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = OrderScreen();

      await tester.pumpWidget(ProviderScope(
        overrides: [
          orderViewModelProvider.overrideWithProvider(
              StateNotifierProvider((ref) => OrderViewModel(mockOrderService)))
        ],
        child: MaterialApp(
          home: screen,
        ),
      ));

      await tester.pump(Duration(seconds: 20));
      expect(find.byWidget(screen), findsOneWidget);
    });
  });
}
