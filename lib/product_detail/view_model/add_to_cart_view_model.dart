import 'dart:convert';

import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final addToCartViewModelProvider =
    StateNotifierProvider<ProductDetailMovieViewModel, bool>((ref) =>
        ProductDetailMovieViewModel(
            ref.read(cartServiceProvider), ref.read(storageProvider)));

class ProductDetailMovieViewModel extends StateNotifier<bool> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  ProductDetailMovieViewModel(this._cartService, this._secureStorage)
      : super(false);

  addToCart(int shoeColor, int shoeSize, String shoeId, String shoeName,
      double shoePrice, String shoeImageUrl) async {
    List<ShoeInCart> inputStrg = [];
    int totalShoe = 1;

    var strShoeColor = shoeColor.toRadixString(16);
    var newStrShoeColor = strShoeColor.replaceAll('ff', '#');

    Cart inCart = new Cart(newStrShoeColor, shoeSize, shoeName, shoePrice,
        shoeImageUrl, totalShoe);

    ShoeInCart shoeInCart = new ShoeInCart(shoeId, inCart);

    int indexOfShoe;
    // await _secureStorage.deleteAll();
    Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();

    if (shoeInCartList.isNotEmpty) {
      var tempListShoeInCart =
          jsonDecode(shoeInCartList['shoeInCart']) as List; //as List;

      List<ShoeInCart> listShoeInCart = tempListShoeInCart
          .map((tagJson) => ShoeInCart.fromJson(tagJson))
          .toList();

      indexOfShoe = tempListShoeInCart
          .indexWhere((element) => element["shoeId"] == shoeId);
      if (indexOfShoe >= 0) {
        print(listShoeInCart[indexOfShoe]);
        print(listShoeInCart[indexOfShoe].result.totalShoe);
        Cart updateInCart = new Cart(
            listShoeInCart[indexOfShoe].result.shoeColor,
            listShoeInCart[indexOfShoe].result.shoeSize,
            listShoeInCart[indexOfShoe].result.shoeName,
            listShoeInCart[indexOfShoe].result.shoePrice,
            listShoeInCart[indexOfShoe].result.shoeImageUrl,
            listShoeInCart[indexOfShoe].result.totalShoe + 1);

        ShoeInCart updateShoeInCart = new ShoeInCart(shoeId, updateInCart);

        listShoeInCart.removeAt(indexOfShoe);
        listShoeInCart.add(updateShoeInCart);
        await _secureStorage.deleteAll();
        await _cartService.setShoeInCart(jsonEncode(listShoeInCart));
        state = false;
      } else {
        listShoeInCart.add(shoeInCart);
        await _cartService.setShoeInCart(jsonEncode(listShoeInCart));
        state = true;
      }
    } else {
      inputStrg.add(shoeInCart);
      await _cartService.setShoeInCart(jsonEncode(inputStrg));
      state = true;
    }
  }
}
