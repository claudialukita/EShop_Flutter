import 'package:flutter_riverpod/flutter_riverpod.dart';

final sizeViewModelProvider = StateNotifierProvider<SizeViewModel, int>(
    (ref) => SizeViewModel());

class SizeViewModel extends StateNotifier<int> {
  SizeViewModel() : super(-1);

  selectSize(int indexSize) async {
    state = indexSize;
  }
}
