import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectAddressViewModelProvider = StateNotifierProvider<SelectAddressViewModel, int>(
        (ref) => SelectAddressViewModel());

class SelectAddressViewModel extends StateNotifier<int> {
  SelectAddressViewModel() : super(-1);

  selectSize(int indexSize) async {
    state = indexSize;
  }
}