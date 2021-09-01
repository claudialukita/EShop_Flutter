import 'package:eshop_flutter/core/services/profile_service.dart';
import 'package:eshop_flutter/profile/profile_screen.dart';
import 'package:eshop_flutter/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/profile_screen_response.dart';
import 'profile_screen_test.mocks.dart';

@GenerateMocks([ProfileService, ProfileDetailViewModel])
void main() {
  final mockProfileService = MockProfileService();

  when(mockProfileService.getProfile()).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(seconds: 10), () => Future.value(dummyProfile)));

  final mockProfileViewModel = MockProfileDetailViewModel();
  when(mockProfileViewModel.loadData()).thenAnswer((realInvocation) => null);

  testWidgets('EShop - Profile Screen', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
        final screen = Profile();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileViewModelProvider.overrideWithProvider(StateNotifierProvider(
                (ref) => ProfileDetailViewModel(mockProfileService)))
          ],
          child: MaterialApp(
            home: screen,
              ),
            ),
      );

      await tester.pump(Duration(seconds: 20));
      expect(find.byWidget(screen), findsOneWidget);
    });
  });
}
