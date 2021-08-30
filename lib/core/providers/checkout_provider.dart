import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final commitCheckoutProvider =
StateNotifierProvider<CommitCheckout, AsyncState<CheckoutResponse>>(
        (ref) => CommitCheckout(
        ref.read(shoeServiceProvider), ref.read(storageProvider)));

class CommitCheckout extends StateNotifier<AsyncState<CheckoutResponse>> {
  final ShoeService _shoeService;
  final FlutterSecureStorage _secureStorage;

  CommitCheckout(this._shoeService, this._secureStorage)
      : super(Initial<CheckoutResponse>(null));

  commitCheckout(List<ShoeItems> initCheckout, AddressDetail addressDetail, double totalPrice, double limit) async {

    state = Loading(state.data);
    try {
      if(totalPrice <= limit){
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
