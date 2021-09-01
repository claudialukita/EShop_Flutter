import 'package:eshop_flutter/card_detail/widgets/card_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:network_image_mock/network_image_mock.dart';

@GenerateMocks([])
void main() {
  testWidgets('EShop - Card Screen: Card carousel widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = CardCarouselWidget();

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
