// import 'dart:convert';
//
// import 'package:eshop_flutter/core/models/async_state.dart';
// import 'package:eshop_flutter/core/models/checkout.dart';
// import 'package:eshop_flutter/core/models/response.dart';
// import 'package:eshop_flutter/core/providers/storage_provider.dart';
// import 'package:eshop_flutter/core/services/cart_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// final checkoutViewModelProvider =
// StateNotifierProvider<CheckoutViewModel, AsyncState<CodeMessage>>((ref) =>
//     CheckoutViewModel(
//         ref.read(cartServiceProvider), ref.read(storageProvider)));
//
// class CheckoutViewModel extends StateNotifier<AsyncState<CodeMessage>> {
//   final CartService _cartService;
//   final FlutterSecureStorage _secureStorage;
//   CheckoutViewModel(this._cartService, this._secureStorage) : super(Initial<CodeMessage>(null));
//
//   initialCheckout(List<String> shoeId, List<int> quantity) async {
//     List<ShoeItems> newListShoeItems = [];
//     int indexOfShoeItem;
//
//
//     ShoeItems shoeItems = new ShoeItems(shoeId, quantity);
//
//     String? getShoeItems = await _secureStorage.read(key: 'initialCheckout');
//     if(getShoeItems!.isNotEmpty){
//
//       var tempListShoeItems =
//       jsonDecode(getShoeItems) as List;
//
//       List<ShoeItems> listShoeItems = tempListShoeItems
//           .map((tagJson) => ShoeItems.fromJson(tagJson))
//           .toList();
//
//       indexOfShoeItem = listShoeItems
//           .indexWhere((element) => element == shoeId);
//
//
//       if(indexOfShoeItem >= 0){
//         listShoeItems.removeAt(indexOfShoeItem);
//         listShoeItems.add(shoeItems);
//       } else {
//         listShoeItems.add(shoeItems);
//       }
//       //sama?
//       // //hapus
//       // //write
//       //beda?
//       // //add
//       // //write
//     } else {
//       newListShoeItems.add(shoeItems);
//
//       //langsung write
//     }
//
//   }
// }
