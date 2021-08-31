import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectAddressViewModelProvider = StateNotifierProvider<SelectAddressViewModel, int>(
        (ref) => SelectAddressViewModel());

class SelectAddressViewModel extends StateNotifier<int> {
  SelectAddressViewModel() : super(-1);

  selectAddress(int indexAddress) async {
    state = indexAddress;
  }
}