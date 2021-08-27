import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailViewModelProvider =
StateNotifierProvider<ProductDetailViewModel, AsyncState<ShoeDetail>>(
        (ref) => ProductDetailViewModel(ref.read(shoeServiceProvider)));

class ProductDetailViewModel extends StateNotifier<AsyncState<ShoeDetail>> {
  final ShoeService _shoeService;
  ProductDetailViewModel(this._shoeService) : super(Initial(null));

  loadData(String keyword) async {
    state = Loading(state.data);
    try {
      var shoeList = await _shoeService.getShoeDetail(keyword);
      state = new Success(shoeList);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }


}