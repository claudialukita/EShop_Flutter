import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final shoeStateViewModelProvider =
    StateNotifierProvider<ShoeStateViewModel, bool>((ref) => ShoeStateViewModel(
        ref.read(cartServiceProvider), ref.read(storageProvider)));

class ShoeStateViewModel extends StateNotifier<bool> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  ShoeStateViewModel(this._cartService, this._secureStorage) : super(false);

  initialCartState() async {
    Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();
    if (shoeInCartList.isNotEmpty) {
      state = true;
    }
  }

  updateCartState() async {
    // Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();
    // if (shoeInCartList.isNotEmpty) {
      state = false;
    // }
  }
}
