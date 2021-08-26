import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/services/shoe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoeGridViewModelProvider =
StateNotifierProvider<ShoeGridViewModel, AsyncState<List<ShoeList>>>(
        (ref) => ShoeGridViewModel(ref.read(shoeServiceProvider)));

class ShoeGridViewModel extends StateNotifier<AsyncState<List<ShoeList>>> {
  final ShoeService _shoeService;
  ShoeGridViewModel(this._shoeService) : super(Initial(null));

  loadDataByKeyword(String keyword) async {
    state = Loading(state.data);
    try {
      var shoeList = await _shoeService.getShoesByKeyword(keyword);
      state = new Success(shoeList);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  loadAllData() async {
    state = Loading(state.data);
    try {
      var shoeList = await _shoeService.getAllShoes();
      state = new Success(shoeList);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}
