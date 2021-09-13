import 'dart:convert';

import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider =
    StateNotifierProvider<CartProvider, AsyncState<SummaryCart>>(
        (ref) => CartProvider(ref.read(cartServiceProvider)));

class CartProvider extends StateNotifier<AsyncState<SummaryCart>> {
  final CartService _cartService;
  CartProvider(this._cartService) : super(Initial(null));

  getCartList() async {
    try{
      SummaryCart summaryCartInStorage = await _cartService.getShoeInCart();
      state = Success(summaryCartInStorage);
    } catch (Exception){
      state = DataIsEmpty(null);
    }
  }

  addToCartList(
      SummaryCart? listCart,
      ShoeDetail? shoeDetail,
      int shoeColor,
      int shoeSize,
      String shoeName,
      double shoePrice,
      String shoeImageUrl) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> listShoeInCart;
      int indexOfShoe;

      int totalShoe = 1;
      ShoeInCart shoeInCart;
      SummaryCart summaryCart;
      Summary summary;
      double shippingCost = 40;
      double subTotal = 0;
      double tax = 0;
      double totalPrice = 0;
      double allShoePrice = 0;

      int indexOfShoeId = shoeDetail!.shoeItem.indexWhere((element) =>
          (element.color == shoeColor) && (element.size == shoeSize));

      if (listCart == null) {
        listShoeInCart = [];
        Cart inCart = new Cart(
            shoeColor, shoeSize, shoeName, shoePrice, shoeDetail.shoeItem[indexOfShoeId].imageUrl, totalShoe);

        shoeInCart =
            new ShoeInCart(shoeDetail.shoeItem[indexOfShoeId].id, inCart);
        listShoeInCart.add(shoeInCart);

        shippingCost = 40;
        subTotal = shoePrice * totalShoe;
        tax = subTotal * 0.1;
        totalPrice = subTotal + shippingCost + tax;
        summary = new Summary(subTotal, shippingCost, tax, totalPrice);

        summaryCart = new SummaryCart(listShoeInCart, summary);
        String encodeSummaryCard = json.encode(summaryCart.toJson());
        await _cartService.setShoeInCart(encodeSummaryCard);
        state = Success(summaryCart);
      } else {
        listShoeInCart = listCart.listCart;
        indexOfShoe = listShoeInCart.indexWhere((element) =>
            element.shoeId == shoeDetail.shoeItem[indexOfShoeId].id);
        if (indexOfShoe >= 0) {
          int updateQty = listShoeInCart[indexOfShoe].result.totalShoe + 1;
          double updateShoePrice =
              (listShoeInCart[indexOfShoe].result.shoePrice /
                      listShoeInCart[indexOfShoe].result.totalShoe) *
                  updateQty;
          // listShoeInCart.removeAt(indexOfShoe);

          Cart inCart = new Cart(shoeColor, shoeSize, shoeName, updateShoePrice,
              shoeDetail.shoeItem[indexOfShoeId].imageUrl, updateQty);

          shoeInCart = new ShoeInCart(shoeDetail.shoeItem[indexOfShoeId].id, inCart);

          // listShoeInCart.add(shoeInCart);
          listShoeInCart[indexOfShoe] = shoeInCart;

          for (var itemShoePrice in listShoeInCart) {
            allShoePrice += itemShoePrice.result.shoePrice;
          }

          shippingCost = 40;
          subTotal = allShoePrice; // shoePrice * totalShoe;
          tax = subTotal * 0.1;
          totalPrice = subTotal + shippingCost + tax;
          summary = new Summary(subTotal, shippingCost, tax, totalPrice);

          summaryCart = new SummaryCart(listShoeInCart, summary);
          await _cartService.setShoeInCart(jsonEncode(summaryCart));
          state = Success(summaryCart);
        } else {
          Cart inCart = new Cart(shoeColor, shoeSize, shoeName, shoePrice,
              shoeDetail.shoeItem[indexOfShoeId].imageUrl, totalShoe);

          shoeInCart = new ShoeInCart(shoeDetail.shoeItem[indexOfShoeId].id, inCart);
          listShoeInCart.add(shoeInCart);

          for (var itemShoePrice in listShoeInCart) {
            allShoePrice += itemShoePrice.result.shoePrice;
          }

          shippingCost = 40;
          subTotal = allShoePrice;
          tax = subTotal * 0.1;
          totalPrice = subTotal + shippingCost + tax;
          summary = new Summary(subTotal, shippingCost, tax, totalPrice);

          summaryCart = new SummaryCart(listShoeInCart, summary);
          await _cartService.setShoeInCart(jsonEncode(summaryCart));
          state = Success(summaryCart);
        }
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  updateCartList(
      SummaryCart? listCart,
      int qty,
      int shoeColor,
      int shoeSize,
      String shoeId,
      String shoeName,
      double shoePrice,
      String shoeImageUrl) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> listShoeInCart;
      int indexOfShoe;

      ShoeInCart shoeInCart;
      SummaryCart summaryCart;
      Summary summary;
      double shippingCost = 40;
      double subTotal = 0;
      double tax = 0;
      double totalPrice = 0;
      double allShoePrice = 0;

      SummaryCart allShoeInCart = await _cartService.getShoeInCart();

      int indexOfShoeId = allShoeInCart.listCart.indexWhere((element) =>
      (element.result.shoeColor == shoeColor) && (element.result.shoeSize == shoeSize));

      if (listCart == null) {
        listShoeInCart = [];
        Cart inCart = new Cart(
            shoeColor, shoeSize, shoeName, shoePrice, shoeImageUrl, qty);

        shoeInCart = new ShoeInCart(shoeId, inCart);
        listShoeInCart.add(shoeInCart);

        shippingCost = 40;
        subTotal = shoePrice * qty;
        tax = subTotal * 0.1;
        totalPrice = subTotal + shippingCost + tax;
        summary = new Summary(subTotal, shippingCost, tax, totalPrice);

        summaryCart = new SummaryCart(listShoeInCart, summary);
        await _cartService.setShoeInCart(jsonEncode(summaryCart));
        state = Success(summaryCart);
      } else {
        listShoeInCart = listCart.listCart;
        indexOfShoe =
            listShoeInCart.indexWhere((element) => element.shoeId == allShoeInCart.listCart[indexOfShoeId].shoeId);
        if (indexOfShoe >= 0) {
          double updateShoePrice =
              (listShoeInCart[indexOfShoe].result.shoePrice /
                      listShoeInCart[indexOfShoe].result.totalShoe) *
                  qty;
          // listShoeInCart.removeAt(indexOfShoe);

          Cart inCart = new Cart(shoeColor, shoeSize, shoeName, updateShoePrice,
              shoeImageUrl, qty);

          shoeInCart = new ShoeInCart(allShoeInCart.listCart[indexOfShoeId].shoeId, inCart);

          // listShoeInCart.add(shoeInCart);
          listShoeInCart[indexOfShoe] = shoeInCart;

          for (var itemShoePrice in listShoeInCart) {
            allShoePrice += itemShoePrice.result.shoePrice;
          }

          shippingCost = 40;
          subTotal = allShoePrice; // shoePrice * totalShoe;
          tax = subTotal * 0.1;
          totalPrice = subTotal + shippingCost + tax;
          summary = new Summary(subTotal, shippingCost, tax, totalPrice);

          summaryCart = new SummaryCart(listShoeInCart, summary);
          await _cartService.setShoeInCart(jsonEncode(summaryCart));
          state = Success(summaryCart);
        } else {
          Cart inCart = new Cart(
              shoeColor, shoeSize, shoeName, shoePrice, shoeImageUrl, qty);

          shoeInCart = new ShoeInCart(allShoeInCart.listCart[indexOfShoeId].shoeId, inCart);
          listShoeInCart.add(shoeInCart);

          for (var itemShoePrice in listShoeInCart) {
            allShoePrice += itemShoePrice.result.shoePrice;
          }

          shippingCost = 40;
          subTotal = allShoePrice;
          tax = subTotal * 0.1;
          totalPrice = subTotal + shippingCost + tax;
          summary = new Summary(subTotal, shippingCost, tax, totalPrice);

          summaryCart = new SummaryCart(listShoeInCart, summary);
          await _cartService.setShoeInCart(jsonEncode(summaryCart));

          state = Success(summaryCart);
        }
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  removeShoe(SummaryCart? listCart, int idx) async {
    state = Loading(state.data);
    try {
      List<ShoeInCart> listShoeInCart;
      double allShoePrice = 0;
      double shippingCost = 40;
      double subTotal = 0;
      double tax = 0;
      double totalPrice = 0;

      ShoeInCart shoeInCart;
      SummaryCart summaryCart;
      Summary summary;

      listShoeInCart = listCart!.listCart;

      listShoeInCart.removeAt(idx);

      if (listShoeInCart.isNotEmpty) {
        for (var itemShoePrice in listShoeInCart) {
          allShoePrice += itemShoePrice.result.shoePrice;
        }

        shippingCost = 40;
        subTotal = allShoePrice; // shoePrice * totalShoe;
        tax = subTotal * 0.1;
        totalPrice = subTotal + shippingCost + tax;
        summary = new Summary(subTotal, shippingCost, tax, totalPrice);
        summaryCart = new SummaryCart(listShoeInCart, summary);
        await _cartService.setShoeInCart(jsonEncode(summaryCart));
        state = Success(summaryCart);
      } else {
        await _cartService.resetShoeInCart();
        state = Initial(null);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  resetShoeCart() async {
    await _cartService.resetShoeInCart();
    state = Initial(null);
  }
}
