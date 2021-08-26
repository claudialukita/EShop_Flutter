// import 'dart:convert';
//
// import 'package:eshop_flutter/core/models/cart.dart';
// import 'package:eshop_flutter/core/models/shoe.dart';
// import 'package:eshop_flutter/core/providers/storage_provider.dart';
// import 'package:eshop_flutter/core/services/cart_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// final addStateViewModelProvider =
// StateNotifierProvider<AddStateMovieViewModel, bool>((ref) =>
//     AddStateMovieViewModel(
//         ref.read(cartServiceProvider), ref.read(storageProvider)));
//
// class AddStateMovieViewModel extends StateNotifier<bool> {
//   final CartService _cartService;
//   final FlutterSecureStorage _secureStorage;
//   AddStateMovieViewModel(this._cartService, this._secureStorage)
//       : super(false);
//
//   addToCart(int? shoeColor, int? shoeSize) async {
//     if(shoeColor != 0 && shoeSize != 0){
//       ShoeColorSize shoeColorSize = new ShoeColorSize(shoeColor, shoeSize);
//       state = true;
//     } else {
//       state = false;
//     }
//   }
// }
