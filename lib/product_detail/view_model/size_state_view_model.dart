import 'package:flutter_riverpod/flutter_riverpod.dart';

final sizeViewModelProvider = StateNotifierProvider<SizeMovieViewModel, int>(
    (ref) => SizeMovieViewModel());

class SizeMovieViewModel extends StateNotifier<int> {
  SizeMovieViewModel() : super(-1);

  selectSize(int indexSize) async {
    state = indexSize;
  }
}
