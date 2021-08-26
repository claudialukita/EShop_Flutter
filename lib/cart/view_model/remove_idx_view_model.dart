import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:eshop_flutter/core/services/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final removeIdxViewModelProvider =
StateNotifierProvider<RemoveIdxViewModel, int>((ref) => RemoveIdxViewModel(
    ref.read(cartServiceProvider), ref.read(storageProvider)));

class RemoveIdxViewModel extends StateNotifier<int> {
  final CartService _cartService;
  final FlutterSecureStorage _secureStorage;
  RemoveIdxViewModel(this._cartService, this._secureStorage) : super(-1);

  removeIdx(int shoeIndex) async {
    state = shoeIndex;
  }
}
