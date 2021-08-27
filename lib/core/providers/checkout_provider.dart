import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commitCheckoutProvider =
StateNotifierProvider<CommitCheckout, AsyncState<CheckoutResponse>>(
        (ref) => CommitCheckout(
        ref.read(shoeServiceProvider)));

class CommitCheckout extends StateNotifier<AsyncState<CheckoutResponse>> {
  final ShoeService _shoeService;

  CommitCheckout(this._shoeService)
      : super(Initial<CheckoutResponse>(null));

  commitCheckout(List<ShoeItems> initCheckout, AddressDetail addressDetail, double totalPrice) async {

    state = Loading(state.data);
    try {
      if(totalPrice <= 1000000){
        Checkout commCheckout = new Checkout(initCheckout, addressDetail);

        var resCommCheckout = await _shoeService.postCheckout(commCheckout);

        if(resCommCheckout.statusCode == 200){
          state = Success(resCommCheckout);
        } else {
          state = ResponseError(resCommCheckout);
        }


      } else {
        throw new Exception('Limit');
      }


    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
