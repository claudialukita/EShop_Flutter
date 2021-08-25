import 'dart:convert';

import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final productDetailViewModelProvider =
    StateNotifierProvider<ProductDetailMovieViewModel, bool>((ref) =>
        ProductDetailMovieViewModel(
            ref.read(cartServiceProvider), ref.read(storageProvider)));

class ProductDetailMovieViewModel extends StateNotifier<bool> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  ProductDetailMovieViewModel(this._cartService, this._secureStorage)
      : super(false);

  // getFavorite(int movieId) async{
  //   List<dynamic> favoriteMovieList = [];
  //   Map<String, dynamic> favMovieInList = await _secureStorage.readAll();
  //   favoriteMovieList = favMovieInList.values.toList();
  //   if(favoriteMovieList.contains(movieId)){
  //     state = true;
  //   } else {
  //     state = false;
  //   }
  // }

  addToCart(String shoeColor, String shoeSize, String shoeId, String shoeName,
      double shoePrice, String shoeImageUrl) async {

    var indexOfShoe = null;
    Map shoeItemsCart = {};
    var shoeInCart;
    var newShoeInCartListValue;
    // await _secureStorage.deleteAll();
    Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();
    if (shoeInCartList.isNotEmpty) {
      print(1);
      print(shoeInCart.runtimeType);
      print(2);
      print(shoeInCartList.runtimeType);
      print(3);
      print(json.encode(shoeInCartList).runtimeType);
      print(4);
      print(json.decode(json.encode(shoeInCartList)).runtimeType);
      print(5);
      var nn = json.decode(json.encode(shoeInCartList)) ;
      print(nn['shoeInCart'].runtimeType);

      shoeInCart = shoeInCartList['shoeInCart'];
      indexOfShoe = shoeInCart.indexWhere((element) => element["shoeId"] == "shoeId");
      // newShoeInCartListValue = shoeInCartList['shoeInCart'];
      if (indexOfShoe >= 0) {
        shoeInCart.removeWhere((element) => element["shoeId"] == "shoeId");
        await _cartService.removeShoeInCart(shoeInCart);
        state = false;
      } else {
        shoeInCart.add({
          "shoeId": shoeId,
          "result": shoeItemsCart
        });
        shoeItemsCart.putIfAbsent("shoeColor", () => shoeColor);
        shoeItemsCart.putIfAbsent("shoeSize", () => shoeSize);
        shoeItemsCart.putIfAbsent("shoeName", () => shoeName);
        shoeItemsCart.putIfAbsent("shoePrice", () => shoePrice);
        shoeItemsCart.putIfAbsent("shoeImageUrl", () => shoeImageUrl);
        await _cartService.setShoeInCart(shoeInCart);
        state = true;
      }
    } else {
      shoeInCart.add({
        "shoeId": shoeId,
        "result": shoeItemsCart
      });
      shoeItemsCart.putIfAbsent("shoeColor", () => shoeColor);
      shoeItemsCart.putIfAbsent("shoeSize", () => shoeSize);
      shoeItemsCart.putIfAbsent("shoeName", () => shoeName);
      shoeItemsCart.putIfAbsent("shoePrice", () => shoePrice);
      shoeItemsCart.putIfAbsent("shoeImageUrl", () => shoeImageUrl);
      await _cartService.setShoeInCart(shoeInCart);
      state = true;
    }
  }
}
