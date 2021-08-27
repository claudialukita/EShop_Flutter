import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartProvider =
    StateNotifierProvider<AddToCartProvider, AsyncState<List<ShoeInCart>>>(
        (ref) => AddToCartProvider());

class AddToCartProvider extends StateNotifier<AsyncState<List<ShoeInCart>>> {
  AddToCartProvider() : super(Initial([]));

  addToCart(int shoeColor, int shoeSize, String shoeId, String shoeName,
      double shoePrice, String shoeImageUrl) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> listShoeInCart = [];
      int totalShoe = 1;

      Cart inCart = new Cart(
          shoeColor, shoeSize, shoeName, shoePrice, shoeImageUrl, totalShoe);

      ShoeInCart shoeInCart = new ShoeInCart(shoeId, inCart);
      listShoeInCart.add(shoeInCart);

      state = Success(listShoeInCart);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  updateCart(String addorRemove, int shoeColor, int shoeSize, String shoeId,
      String shoeName, double shoePrice, String shoeImageUrl, int qty) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> listShoeInCart = [];
      int totalShoe = 1;
      int indexOfShoe;
      double updateShoePrice;
      int updateTotalShoe;

      // print("open: shoeColor ${shoeColor}");
      //
      // var strShoeColor = shoeColor.toRadixString(16);
      // var newStrShoeColor = strShoeColor.replaceAll('ff', '#');

      Cart inCart = new Cart(
          shoeColor, shoeSize, shoeName, shoePrice, shoeImageUrl, totalShoe);

      ShoeInCart shoeInCart = new ShoeInCart(shoeId, inCart);

      if (listShoeInCart.isNotEmpty) {
        indexOfShoe =
            listShoeInCart.indexWhere((element) => element.shoeId == shoeId);
        if (indexOfShoe >= 0) {
          updateTotalShoe = listShoeInCart[indexOfShoe].result.totalShoe + 1;
          updateShoePrice = (listShoeInCart[indexOfShoe].result.shoePrice /
                  listShoeInCart[indexOfShoe].result.totalShoe) *
              updateTotalShoe;

          Cart updateInCart = new Cart(
              listShoeInCart[indexOfShoe].result.shoeColor,
              listShoeInCart[indexOfShoe].result.shoeSize,
              listShoeInCart[indexOfShoe].result.shoeName,
              updateShoePrice,
              listShoeInCart[indexOfShoe].result.shoeImageUrl,
              updateTotalShoe);

          ShoeInCart updateShoeInCart = new ShoeInCart(shoeId, updateInCart);

          listShoeInCart.removeAt(indexOfShoe);
          listShoeInCart.add(updateShoeInCart);

          state = Success(listShoeInCart);
        } else {
          listShoeInCart.add(shoeInCart);
          state = Success(listShoeInCart);
        }
      } else {
        state = DataIsEmpty(null);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
