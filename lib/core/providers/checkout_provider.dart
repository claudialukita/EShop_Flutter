import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commitCheckoutProvider =
    StateNotifierProvider<CommitCheckout, AsyncState<bool>>((ref) =>
        CommitCheckout(
            ref.read(shoeServiceProvider), ref.read(cartServiceProvider)));

class CommitCheckout extends StateNotifier<AsyncState<bool>> {
  final ShoeService _shoeService;
  final CartService _cartService;

  CommitCheckout(this._shoeService, this._cartService)
      : super(Initial<bool>(false));

  commitCheckout(List<ShoeItems> initCheckout, AddressDetail addressDetail,
      double totalPrice, double limit) async {
    state = Loading(state.data);
    try {
      if (totalPrice <= limit) {
        Checkout commCheckout = new Checkout(initCheckout, addressDetail);

        var resCommCheckout = await _shoeService.postCheckout(commCheckout);

        if (resCommCheckout is ResponseError) {
          state = ResponseError(false);
        }
        if (resCommCheckout is Success) {
          state = Success(true);
          await _cartService.resetShoeInCart();
        }
      } else {
        throw new Exception('Limit');
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  initialState() async{
    state = Initial(false);
  }
}
