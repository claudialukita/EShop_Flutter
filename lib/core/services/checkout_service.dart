import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final checkoutServiceProvider =
Provider((ref) => CheckoutService(ref.read(storageProvider)));

class CheckoutService {
  final FlutterSecureStorage _storageProvider;

  CheckoutService(this._storageProvider);

  Future setCheckout(String listShoeInCart) async {
    await _storageProvider.write(key: 'checkout', value: listShoeInCart);
  }

  Future removeShoeInCart(String listShoeInCart) async {
    // await _storageProvider.deleteAll();
    await _storageProvider.write(key: 'shoeInCart', value: listShoeInCart);
  }

}
