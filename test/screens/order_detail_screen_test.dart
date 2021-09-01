import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:eshop_flutter/order/detail/order_detail_screen.dart';
import 'package:eshop_flutter/order/detail/order_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/order_screen_response.dart';
import 'order_detail_screen_test.mocks.dart';

@GenerateMocks([OrderService, OrderDetailViewModel])
void main() {
  final mockOrderService = MockOrderService();

  when(mockOrderService.getDetailOrder('510fd0f3-a21e-41de-a23a-82a55b41e739')).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(seconds: 10),
              () => Future.value(dummyOrderDetail)));

  final mockOrderDetailViewModel = MockOrderDetailViewModel();
  when(mockOrderDetailViewModel.loadData('510fd0f3-a21e-41de-a23a-82a55b41e739')).thenAnswer((realInvocation) => null);

  testWidgets('EShop - Order Detail Screen',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          final screen = OrderDetail();

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                orderDetailViewModelProvider.overrideWithProvider(StateNotifierProvider(
                        (ref) => OrderDetailViewModel(mockOrderService)))
              ],
              child: MaterialApp(
                home: screen,
                ),
              ),
          );

          await tester.pump(Duration(seconds: 20));
          expect(find.byWidget(screen), findsWidgets);
        });
      });
}