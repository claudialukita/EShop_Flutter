// import 'package:eshop_flutter/core/models/async_state.dart';
// import 'package:eshop_flutter/core/models/checkout.dart';
// import 'package:eshop_flutter/core/providers/storage_provider.dart';
// import 'package:eshop_flutter/core/services/shoe_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// final commitCheckoutViewModelProvider =
// StateNotifierProvider<CommitCheckoutViewModel, AsyncState<CheckoutResponse>>(
//         (ref) => CommitCheckoutViewModel(
//         ref.read(shoeServiceProvider), ref.read(storageProvider)));
//
// class CommitCheckoutViewModel extends StateNotifier<AsyncState<CheckoutResponse>> {
//   final ShoeService _shoeService;
//   final FlutterSecureStorage _secureStorage;
//
//   CommitCheckoutViewModel(this._shoeService, this._secureStorage)
//       : super(Initial<CheckoutResponse>(null));
//
//   commitCheckout(List<ShoeItems> initCheckout, AddressDetail addressDetail, double totalPrice) async {
//
//     state = Loading(state.data);
//     try {
//       if(totalPrice <= 1000000){
//         Checkout commCheckout = new Checkout(initCheckout, addressDetail);
//
//         var resCommCheckout = await _shoeService.postCheckout(commCheckout);
//
//         if(resCommCheckout.statusCode == 200){
//           await _secureStorage.delete(key: 'shoeInCart');
//         }
//         state = Success(resCommCheckout);
//
//       } else {
//         throw new Exception('Limit');
//       }
//
//
//     } catch (exception) {
//       state = Error('Something went wrong', state.data);
//     }
//   }
// }
