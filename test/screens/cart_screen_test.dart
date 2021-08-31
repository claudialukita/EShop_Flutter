import 'package:eshop_flutter/cart/widgets/cart_is_empty_widget.dart';
import 'package:eshop_flutter/cart/widgets/cart_list_widget.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/cart_screen_response.dart';
import 'cart_screen_test.mocks.dart';

@GenerateMocks([CartService])
void main() {
  final mockCartService = MockCartService();
  when(mockCartService.setShoeInCart('try')).thenAnswer(
      (realInvocation) async =>
          Future.delayed(Duration(milliseconds: 100), () => Future.value()));

  when(mockCartService.resetShoeInCart()).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 1000000), () => Future.value()));

  when(mockCartService.getShoeInCart()).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 1000000),
          () => Future.value(dummySummaryCart)));

  testWidgets('EShop - Cart Screen: Cart list widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = CartListWidget();

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

  testWidgets('EShop - Cart Screen: Cart is empty widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = CartIsEmptyWidget();

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
