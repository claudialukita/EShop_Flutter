// import 'package:eshop_flutter/core/models/async_state.dart';
// import 'package:eshop_flutter/core/models/cart.dart';
// import 'package:eshop_flutter/core/models/checkout.dart';
// import 'package:eshop_flutter/core/providers/storage_provider.dart';
// import 'package:eshop_flutter/core/services/cart_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// final checkoutViewModelProvider =
//     StateNotifierProvider<CheckoutViewModel, AsyncState<List<ShoeItems>>>(
//         (ref) => CheckoutViewModel());
//
// class CheckoutViewModel extends StateNotifier<AsyncState<List<ShoeItems>>> {
//
//   CheckoutViewModel()
//       : super(Initial<List<ShoeItems>>([]));
//
//   initialCheckout(List<ShoeInCart> shoeListWtch, Summary shoePriceWtch) async {
//     state = Loading(state.data);
//     try {
//       List<ShoeItems> newListShoeItems = [];
//       print(shoeListWtch.length);
//
//       for (var listShoeId in shoeListWtch) {
//         ShoeItems newCheckoutShoeItems =
//             new ShoeItems(listShoeId.shoeId, listShoeId.result.totalShoe, shoePriceWtch.totalPrice);
//         newListShoeItems.add(newCheckoutShoeItems);
//       }
//
//       state = Success(newListShoeItems);
//     } catch (exception) {
//       state = Error('Something went wrong', state.data);
//     }
//   }
// }
