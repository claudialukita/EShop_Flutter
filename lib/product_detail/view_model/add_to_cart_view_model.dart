import 'dart:convert';

import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final addToCartViewModelProvider = StateNotifierProvider<
        ProductDetailMovieViewModel, AsyncState<List<ShoeInCart>>>(
    (ref) => ProductDetailMovieViewModel(
        ref.read(cartServiceProvider), ref.read(storageProvider)));

class ProductDetailMovieViewModel
    extends StateNotifier<AsyncState<List<ShoeInCart>>> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  ProductDetailMovieViewModel(this._cartService, this._secureStorage)
      : super(Initial([]));

  addToCart(int shoeColor, int shoeSize, String shoeId, String shoeName,
      double shoePrice, String shoeImageUrl) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> inputStrg = [];
      int totalShoe = 1;

      var strShoeColor = shoeColor.toRadixString(16);
      var newStrShoeColor = strShoeColor.replaceAll('ff', '#');

      Cart inCart = new Cart(newStrShoeColor, shoeSize, shoeName, shoePrice,
          shoeImageUrl, totalShoe);

      ShoeInCart shoeInCart = new ShoeInCart(shoeId, inCart);

      int indexOfShoe;
      // var shoeInCartList = "";
      // await _secureStorage.deleteAll();
      // var shoeInCartListAll = await _secureStorage.readAll();
      // var shoeInCartList1 = await _secureStorage.//containsKey(key: 'token'); //.read(key: 'token');
      Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();

      var isShoeInCartList = await _secureStorage.containsKey(
          key:
              'shoeInCart'); //containsKey(key: 'shoeInCart'); //.read(key: 'token');

      if (isShoeInCartList) {

        var tempListShoeInCart =
            jsonDecode(shoeInCartList['shoeInCart']) as List;

        List<ShoeInCart> listShoeInCart = tempListShoeInCart
            .map((tagJson) => ShoeInCart.fromJson(tagJson))
            .toList();

        indexOfShoe = tempListShoeInCart
            .indexWhere((element) => element["shoeId"] == shoeId);
        if (indexOfShoe >= 0) {
          int updateTotalShoe =
              listShoeInCart[indexOfShoe].result.totalShoe + 1;
          print(listShoeInCart[indexOfShoe].result.shoePrice);
          print(listShoeInCart[indexOfShoe].result.totalShoe);
          print(updateTotalShoe);
          double updateShoePrice =
              (listShoeInCart[indexOfShoe].result.shoePrice /
                      listShoeInCart[indexOfShoe].result.totalShoe) *
                  updateTotalShoe;
          Cart updateInCart = new Cart(
              listShoeInCart[indexOfShoe].result.shoeColor,
              listShoeInCart[indexOfShoe].result.shoeSize,
              listShoeInCart[indexOfShoe].result.shoeName,
              updateShoePrice,
              listShoeInCart[indexOfShoe].result.shoeImageUrl,
              updateTotalShoe);

          ShoeInCart updateShoeInCart = new ShoeInCart(shoeId, updateInCart);

          listShoeInCart.removeAt(indexOfShoe);
          listShoeInCart.add(updateShoeInCart);
          await _secureStorage.delete(key: 'shoeInCart');
          await _cartService.setShoeInCart(jsonEncode(listShoeInCart));
          state = Success(listShoeInCart);
        } else {
          listShoeInCart.add(shoeInCart);
          await _cartService.setShoeInCart(jsonEncode(listShoeInCart));
          state = Success(listShoeInCart);
        }
      } else {
        inputStrg.add(shoeInCart);
        await _cartService.setShoeInCart(jsonEncode(inputStrg));
        state = Success(inputStrg);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
