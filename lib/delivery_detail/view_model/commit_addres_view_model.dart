import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final commitAddressViewModelProvider =
StateNotifierProvider<CommitAddressViewModel, AsyncState<AddressDetail>>(
        (ref) => CommitAddressViewModel(
        ref.read(cartServiceProvider), ref.read(storageProvider)));

class CommitAddressViewModel extends StateNotifier<AsyncState<AddressDetail>> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;

  CommitAddressViewModel(this._cartService, this._secureStorage)
      : super(Initial<AddressDetail>(null));

  // Checkout
  commitAddress(String street, String phoneNumber, String receiptName) async {
    state = Loading(state.data);
    try {
      AddressDetail newAddressDetail =
      new AddressDetail(street, phoneNumber, receiptName);

      state = Success(newAddressDetail);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
