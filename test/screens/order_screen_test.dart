import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:eshop_flutter/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/order_screen_response.dart';
import 'order_detail_screen_test.mocks.dart';

@GenerateMocks([OrderService])
void main() {
  final mockCartService = MockOrderService();

  when(mockCartService.getOrders()).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 1000000),
              () => Future.value(dummyOrderList)));

  testWidgets('EShop - Order Screen',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          final screen = OrderScreen();

          await tester.pumpWidget(
            ProviderScope(
              child: MaterialApp(
                home: Scaffold(
                  body: SingleChildScrollView(
                    child: screen,
                  ),
                )
              ),
            ),
          );

          await tester.pump(Duration(milliseconds: 200));
          expect(find.byWidget(screen), findsWidgets);
        });
      });
}