import 'package:eshop_flutter/core/services/profile_service.dart';
import 'package:eshop_flutter/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/profile_screen_response.dart';

@GenerateMocks([ProfileService])
void main() {
  final mockProfileService = MockProfileService();

  when(mockProfileService.getProfile('510fd0f3-a21e-41de-a23a-82a55b41e739')).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 1000000),
              () => Future.value(dummyProfile)));

  testWidgets('EShop - Order Detail Screen',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          final screen = Profile();

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