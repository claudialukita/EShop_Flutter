import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commitAddressProvider =
    StateNotifierProvider<CommitAddress, AsyncState<AddressDetail>>(
        (ref) => CommitAddress());

class CommitAddress extends StateNotifier<AsyncState<AddressDetail>> {
  CommitAddress() : super(Initial<AddressDetail>(null));

  commitAddress(String street, String phoneNumber, String receiptName) async {
    state = Loading(state.data);
    try {
      AddressDetail newAddressDetail =
          new AddressDetail(street, phoneNumber, receiptName);

      state = Success(newAddressDetail);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }
}
