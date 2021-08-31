import 'package:eshop_flutter/commit_order/widgets/failed_commit_widget.dart';
import 'package:eshop_flutter/commit_order/widgets/success_commit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:network_image_mock/network_image_mock.dart';

@GenerateMocks([])
void main() {
  testWidgets('EShop - Commit Order Screen: Success commit widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = SuccessCommitWidget();
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

  testWidgets('EShop - Commit Order Screen: Failed commit widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = FailedCommitWidget();
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
