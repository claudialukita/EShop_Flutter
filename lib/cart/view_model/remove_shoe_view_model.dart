import 'dart:convert';

import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final removeShoeViewModelProvider =
    StateNotifierProvider<RemoveShoeViewModel, String>((ref) =>
        RemoveShoeViewModel(
            ref.read(cartServiceProvider), ref.read(storageProvider)));

class RemoveShoeViewModel extends StateNotifier<String> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  RemoveShoeViewModel(this._cartService, this._secureStorage) : super("");

  removeShoeFromCart(String shoeId) async {
    int indexOfShoe;

    Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();

    var isShoeInCartList = await _secureStorage.containsKey(
        key:
            'shoeInCart'); //containsKey(key: 'shoeInCart'); //.read(key: 'token');

    if (isShoeInCartList) {

      var tempListShoeInCart =
          jsonDecode(shoeInCartList['shoeInCart']) as List; //as List;

      List<ShoeInCart> listShoeInCart = tempListShoeInCart
          .map((tagJson) => ShoeInCart.fromJson(tagJson))
          .toList();

      indexOfShoe = tempListShoeInCart
          .indexWhere((element) => element["shoeId"] == shoeId);
      if (listShoeInCart.length > 1) {
        if (indexOfShoe >= 0) {
          listShoeInCart.removeAt(indexOfShoe);
          await _secureStorage.delete(key: 'shoeInCart');
          await _cartService.setShoeInCart(jsonEncode(listShoeInCart));
          state = shoeId;
        }
      } else {
        await _secureStorage.delete(key: 'shoeInCart');
      }
    }
  }
}
