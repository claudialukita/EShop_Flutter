import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorViewModelProvider = StateNotifierProvider<ColorViewModel, int>(
        (ref) => ColorViewModel());

class ColorViewModel extends StateNotifier<int> {
  ColorViewModel() : super(-1);

  selectColor(int indexColor) async {
    state = indexColor;
  }
}
