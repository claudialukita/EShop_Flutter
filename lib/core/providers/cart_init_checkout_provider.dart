import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartInitCheckoutProvider =
StateNotifierProvider<CartInitCheckoutProvider, AsyncState<List<ShoeItems>>>(
        (ref) => CartInitCheckoutProvider());

class CartInitCheckoutProvider extends StateNotifier<AsyncState<List<ShoeItems>>> {

  CartInitCheckoutProvider()
      : super(Initial<List<ShoeItems>>([]));

  initialCheckout(SummaryCart summaryCart) async {
  // initialCheckout(List<ShoeInCart> shoeListWtch, Summary shoePriceWtch) async {
    state = Loading(state.data);
    try {
      List<ShoeItems> newListShoeItems = [];

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
