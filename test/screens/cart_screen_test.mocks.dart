import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:eshop_flutter/core/models/cart.dart' as _i2;
import 'package:eshop_flutter/core/services/cart_service.dart' as _i3;

class _FakeSummaryCart extends _i1.Fake implements _i2.SummaryCart {}

class MockCartService extends _i1.Mock implements _i3.CartService {
  MockCartService() {
    _i1.throwOnMissingStub(this);
  }
  @override
  _i6.Future setShoeInCart(String? listShoeInCart) =>
      (super.noSuchMethod(Invocation.method(#setShoeInCart, [listShoeInCart]),
          returnValue: Future.value()));
  @override
  _i6.Future resetShoeInCart() =>
      (super.noSuchMethod(Invocation.method(#resetShoeInCart, null),
          returnValue: Future.value()));
  @override
  _i6.Future<_i2.SummaryCart> getShoeInCart() =>
      (super.noSuchMethod(Invocation.method(#getShoeInCart, null),
          returnValue: Future<_i2.SummaryCart>.value(_FakeSummaryCart()))
      as _i6.Future<_i2.SummaryCart>);
}

