import 'dart:convert';

import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartInitCheckoutProvider =
StateNotifierProvider<CartInitCheckoutProvider, AsyncState<List<ShoeItems>>>(
        (ref) => CartInitCheckoutProvider(ref.read(cartServiceProvider)));

class CartInitCheckoutProvider extends StateNotifier<AsyncState<List<ShoeItems>>> {
  final CartService _cartService;
  CartInitCheckoutProvider(this._cartService)
      : super(Initial<List<ShoeItems>>([]));

  initialCheckout(SummaryCart summaryCart) async {
    state = Loading(state.data);
    try {
      List<ShoeItems> newListShoeItems = [];
      SummaryCart summaryCartInStorage = await _cartService.getShoeInCart();
      print(summaryCartInStorage);



      for (var listShoeId in summaryCart.listCart) {
        ShoeItems newCheckoutShoeItems =
        new ShoeItems(listShoeId.shoeId, listShoeId.result.totalShoe, summaryCart.summary.totalPrice);
        newListShoeItems.add(newCheckoutShoeItems);
      }

      state = Success(newListShoeItems);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
