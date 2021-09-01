
import 'package:eshop_flutter/core/services/login_service.dart';
import 'package:eshop_flutter/login/login_screen.dart';
import 'package:eshop_flutter/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/login_screen_response.dart';
import 'login_screen_test.mocks.dart';

@GenerateMocks([LoginService, LoginViewModel])
void main() {
  final mockLoginService = MockLoginService();

  when(mockLoginService.getLogin("test@gmail.com", "test123")).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(seconds: 10), () => Future.value(dummyLoginResponse)));

  final mockLoginViewModel = MockLoginViewModel();
  when(mockLoginViewModel.loadData("test@gmail.com", "test123")).thenAnswer((realInvocation) => null);

  testWidgets('EShop - Order Screen', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = Login();

      await tester.pumpWidget(ProviderScope(
        overrides: [
          loginViewModelProvider.overrideWithProvider(
              StateNotifierProvider((ref) => LoginViewModel(mockLoginService)))
        ],
        child: MaterialApp(
          home: screen,
        ),
      ));

      await tester.pump(Duration(seconds: 20));
      expect(find.byWidget(screen), findsOneWidget);
    });
  });
}