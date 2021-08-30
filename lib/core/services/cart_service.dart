import 'dart:convert';

import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final cartServiceProvider =
    Provider((ref) => CartService(ref.read(storageProvider)));

class CartService {
  final FlutterSecureStorage _storageProvider;

  CartService(this._storageProvider);

  Future setShoeInCart(String listShoeInCart) async {
    await _storageProvider.write(key: 'shoeInCart', value: listShoeInCart);
  }

  Future<SummaryCart> getShoeInCart() async {
      Map<String, String> allDataInStorage = await _storageProvider.readAll();
      String? allShoeInCartStr = allDataInStorage['shoeInCart'];
      SummaryCart allShoeInCart = SummaryCart.fromJson(jsonDecode(allShoeInCartStr!));
      print("open: cart");
      print(allShoeInCart.toJson());
      print("close: cart");
      return allShoeInCart;
    // await _storageProvider.write(key: 'shoeInCart', value: listShoeInCart);
  }


}
