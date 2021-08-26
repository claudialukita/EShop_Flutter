import 'dart:convert';

import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final shoeListViewModelProvider =
    StateNotifierProvider<ShoeListMovieViewModel, AsyncState<List<ShoeInCart>>>(
        (ref) => ShoeListMovieViewModel(
            ref.read(cartServiceProvider), ref.read(storageProvider)));

class ShoeListMovieViewModel
    extends StateNotifier<AsyncState<List<ShoeInCart>>> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  ShoeListMovieViewModel(this._cartService, this._secureStorage)
      : super(Initial<List<ShoeInCart>>([]));

  getShoeCartList() async {
    state = Loading(state.data);
    try {
      Map<String, dynamic> getShoeInCartList = await _secureStorage.readAll();
      if(getShoeInCartList.isNotEmpty) {
        var tempListShoeInCart =
        jsonDecode(getShoeInCartList['shoeInCart']) as List; //as List;

        List<ShoeInCart> listShoeInCart = tempListShoeInCart
            .map((tagJson) => ShoeInCart.fromJson(tagJson))
            .toList();

        state = Success(listShoeInCart);
      } else {
        state = DataIsEmpty(null);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
