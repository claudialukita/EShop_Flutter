import 'package:eshop_flutter/delivery_detail/view_model/commit_addres_view_model.dart';
import 'package:eshop_flutter/delivery_detail/view_model/select_address_view_model.dart';
import 'package:eshop_flutter/delivery_detail/widgets/address_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'delivery_detail_screen_test.mocks.dart';

@GenerateMocks([CommitAddressViewModel, SelectAddressViewModel])
void main() {
  final mockCommitAddressViewModel = MockCommitAddressViewModel();
  when(mockCommitAddressViewModel.commitAddress('street', '08123123123', 'tonystorky'))
      .thenAnswer((realInvocation) => null);

  final mockSelectAddressViewModel = MockSelectAddressViewModel();
  when(mockSelectAddressViewModel.selectAddress(0))
      .thenAnswer((realInvocation) => 0);

  testWidgets('EShop - Delivery Detail Screen: Address list widget',
          (WidgetTester tester) async {
        mockNetworkImagesFor(() async {
          final screen = AddressListWidget();

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
