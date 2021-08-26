import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorViewModelProvider = StateNotifierProvider<ColorMovieViewModel, int>(
        (ref) => ColorMovieViewModel());

class ColorMovieViewModel extends StateNotifier<int> {
  ColorMovieViewModel() : super(-1);

  selectColor(int indexColor) async {
    state = indexColor;
  }
}
