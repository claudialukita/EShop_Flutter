import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:eshop_flutter/order/detail/order_detail_screen.dart';
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

  when(mockCartService.getDetailOrder('510fd0f3-a21e-41de-a23a-82a55b41e739')).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 1000000),
              () => Future.value(dummyOrderDetail)));

  testWidgets('EShop - Order Detail Screen',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          final screen = OrderDetail();

          await tester.pumpWidget(
            ProviderScope(
              child: MaterialApp(
                home: SingleChildScrollView(
                  child: screen,
                ),
              ),
            ),
          );

          await tester.pump(Duration(milliseconds: 200));
          expect(find.byWidget(screen), findsWidgets);
        });
      });
}