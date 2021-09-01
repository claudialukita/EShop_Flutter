import 'package:eshop_flutter/product_detail/view_model/color_available_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/color_state_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/product_detail_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/size_state_view_model.dart';
import 'package:eshop_flutter/product_detail/widgets/product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/product_detail_response.dart';
import 'product_detail_test.mocks.dart';

@GenerateMocks([
  SizeViewModel,
  ProductDetailViewModel,
  ColorViewModel,
  ColorAvailableViewModel,
  // ProductDetailWidget,
  // SuccessAddWidget,
  // CarouselSliderDetailWidget
])
Future<void> main() async {
  final mockShoeService = MockShoeService();
  when(mockShoeService.getShoeDetail('9b8e726f-1ec7-453f-9da5-c4356597d618'))
      .thenAnswer((realInvocation) async => Future.delayed(
          Duration(milliseconds: 100), () => Future.value(dummyShoeDetail)));

  final mockSizeViewModel = MockSizeViewModel();
  when(mockSizeViewModel.selectSize(44)).thenAnswer((realInvocation) => 44);

  final mockProductDetailViewModel = MockProductDetailViewModel();
  when(mockProductDetailViewModel
          .loadData('9b8e726f-1ec7-453f-9da5-c4356597d618'))
      .thenAnswer((realInvocation) async => Future.delayed(
          Duration(milliseconds: 100),
          () => Future.value(dummyShoeDetail)));

  final mockColorViewModel = MockColorViewModel();
  when(mockColorViewModel.selectColor(0)).thenAnswer((realInvocation) => 0);

  final mockColorAvailableViewModel = MockColorAvailableViewModel();
  when(mockColorAvailableViewModel.loadColorAvailable(null, 44))
      .thenAnswer((realInvocation) async => Future.delayed(
          Duration(milliseconds: 100), () => Future.value(dummyListColor)));

  testWidgets('EShop - Product Detail Screen: Product grid widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = ProductDetailWidget();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            productDetailViewModelProvider.overrideWithProvider(
                StateNotifierProvider(
                    (ref) => ProductDetailViewModel(mockShoeService)))
          ],
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
