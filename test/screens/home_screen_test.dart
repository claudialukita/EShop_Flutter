import 'package:eshop_flutter/home/view_model/home_view_model.dart';
import 'package:eshop_flutter/home/widgets/carousel_slider_widget.dart';
import 'package:eshop_flutter/home/widgets/item_card_widget.dart';
import 'package:eshop_flutter/home/widgets/notif_icon_widget.dart';
import 'package:eshop_flutter/home/widgets/product_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/home_screen_response.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([ShoeGridViewModel])
void main() {
  final mockShoeService = MockShoeService();
  when(mockShoeService.getAllShoes()).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(milliseconds: 100), () => Future.value(dummyShoeList)));
  when(mockShoeService.getShoesByKeyword('i')).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(milliseconds: 100), () => Future.value(dummyShoeListByKeyword)));

  final mockShoeGridViewModel = MockShoeGridViewModel();
  when(mockShoeGridViewModel.loadAllData())
      .thenAnswer((realInvocation) => null);
  when(mockShoeGridViewModel.loadDataByKeyword('i'))
      .thenAnswer((realInvocation) => null);

  testWidgets('EShop - Home Screen: Product grid widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = ProductGridWidget();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            shoeGridViewModelProvider.overrideWithProvider(
                StateNotifierProvider(
                    (ref) => ShoeGridViewModel(mockShoeService)))
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

  testWidgets('EShop - Home Screen: Carousel slider widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = CarouselSliderHomeWidget();

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

  testWidgets('EShop - Home Screen: Item card widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = ItemCardWidget();

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

  testWidgets('EShop - Home Screen: Notif icon widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = NotifIconWidget();

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
