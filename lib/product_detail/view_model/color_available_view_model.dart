import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorAvailableViewModelProvider =
    StateNotifierProvider<ColorAvailableViewModel, AsyncState<List<int>>>(
        (ref) => ColorAvailableViewModel());

class ColorAvailableViewModel extends StateNotifier<AsyncState<List<int>>> {
  ColorAvailableViewModel() : super(Initial(null));

  loadColorAvailable(ShoeDetail? shoeDetail, int selectedSize) async {
    state = Loading(state.data);
    try {

      List<int> listColor = [];
      List<Stock> stockOfSize = shoeDetail!.shoeItem
          .where((element) => element.size == selectedSize)
          .toList();
      for(var shoeColor in stockOfSize){
        listColor.add(shoeColor.color);
      }
      state = new Success(listColor);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  resetColorAvailable() async{
    state = Initial(null);
  }
}
