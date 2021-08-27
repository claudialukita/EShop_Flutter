import 'dart:convert';

import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final summaryModelProvider =
    StateNotifierProvider<SummaryViewModel, AsyncState<Summary>>(
        (ref) => SummaryViewModel(ref.read(storageProvider)));

class SummaryViewModel extends StateNotifier<AsyncState<Summary>> {
  final FlutterSecureStorage _secureStorage;
  SummaryViewModel(this._secureStorage) : super(Initial<Summary>(null));

  getSummary() async {
    state = Loading(state.data);
    try {
      double sumShoePrice = 0;
      int sumTotalShoe = 0;
      double shippingCost = 40;
      double tax = 0;
      double totalPrice = 0;

      Map<String, dynamic> shoeInCartList = await _secureStorage.readAll();

      var isShoeInCartList = await _secureStorage.containsKey(
          key:
              'shoeInCart'); //containsKey(key: 'shoeInCart'); //.read(key: 'token');

      if (isShoeInCartList) {
        var tempListShoeInCart =
            jsonDecode(shoeInCartList['shoeInCart']) as List; //as List;

        List<ShoeInCart> listShoeInCart = tempListShoeInCart
            .map((tagJson) => ShoeInCart.fromJson(tagJson))
            .toList();

        for (int i = 0; i < listShoeInCart.length; i++) {
          print(i);
          sumShoePrice +=
              double.parse(jsonEncode(listShoeInCart[i].result.shoePrice));
          sumTotalShoe +=
              int.parse(jsonEncode(listShoeInCart[i].result.totalShoe));
        }

        tax = sumShoePrice * 0.1;
        totalPrice = sumShoePrice - tax;

        Summary summary = new Summary(
          sumShoePrice,
          shippingCost,
          tax,
          totalPrice,
        );
        state = Success(summary);
      } else {
        state = DataIsEmpty(null);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
