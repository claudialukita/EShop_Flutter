// // int idx = exmp.indexWhere((element) => (element['name'] == 'name2')&&(element['score']> 20));
//
// import 'package:eshop_flutter/core/models/async_state.dart';
// import 'package:eshop_flutter/core/models/cart.dart';
// import 'package:eshop_flutter/core/models/shoe.dart';
// import 'package:eshop_flutter/core/services/cart_service.dart';
// import 'package:eshop_flutter/core/services/shoe_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final checkStockViewModelProvider =
//     StateNotifierProvider<CheckStockViewModel, bool>((ref) =>
//         CheckStockViewModel(
//             ref.read(cartServiceProvider)));
//
// class CheckStockViewModel extends StateNotifier<bool> {
//   final CartService _cartService;
//   // final ShoeService _shoeService;
//   CheckStockViewModel(this._cartService) : super(false);
//
//   checkStock(ShoeDetail shoeDetail, int selectedSize, int selectedColor) async {
//     int stockIndex = 0, stockIndexFromStorage = 0, addShoe = 0;
//     stockIndex = shoeDetail.shoeItem.indexWhere((element) =>
//         (element.size == selectedSize) && (element.color == selectedColor));
//     try {
//       SummaryCart summaryCartInStorage = await _cartService.getShoeInCart();
//       stockIndexFromStorage = summaryCartInStorage.listCart.indexWhere(
//           (element) => (element.shoeId == shoeDetail.shoeItem[stockIndex].id));
//       addShoe = shoeDetail.shoeItem[stockIndex].stock -
//           summaryCartInStorage.listCart[stockIndexFromStorage].result.totalShoe;
//     } catch (Exception) {
//       addShoe = shoeDetail.shoeItem[stockIndex].stock;
//     }
//     if (addShoe > 0) {
//       state = true;
//     } else {
//       state = false;
//     }
//   }
//
//   // checkStockInCart(
//   //     SummaryCart summaryCart, int selectedSize, int selectedColor) async {
//   //   int idx = summaryCart.listCart.indexWhere((element) =>
//   //   (element.result.shoeSize == selectedSize) && (element.result.shoeColor == selectedColor));
//   //   int stockInDB = summaryCart.listCart[idx].result.stock;
//   //   int numberOfShoes = summaryCart.listCart[idx].result.totalShoe;
//   //   if (numberOfShoes < stockInDB) {
//   //     state = true;
//   //   } else {
//   //     state = false;
//   //   }
//   // }
//   //
//   // resetState() async{
//   //   state = false;
//   // }
// }
