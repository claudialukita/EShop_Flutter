// Mocks generated by Mockito 5.0.15 from annotations
// in eshop_flutter/test/screens/order_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:eshop_flutter/core/models/async_state.dart' as _i3;
import 'package:eshop_flutter/core/models/order_model.dart' as _i2;
import 'package:eshop_flutter/core/services/order_service.dart' as _i4;
import 'package:eshop_flutter/order/order_view_model.dart' as _i6;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:state_notifier/state_notifier.dart' as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeOrder_0 extends _i1.Fake implements _i2.Order {}

class _FakeAsyncState_1<T> extends _i1.Fake implements _i3.AsyncState<T> {}

/// A class which mocks [OrderService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOrderService extends _i1.Mock implements _i4.OrderService {
  MockOrderService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.OrderList>> getOrders() =>
      (super.noSuchMethod(Invocation.method(#getOrders, []),
              returnValue: Future<List<_i2.OrderList>>.value(<_i2.OrderList>[]))
          as _i5.Future<List<_i2.OrderList>>);
  @override
  _i5.Future<_i2.Order> getDetailOrder(String? orderId) =>
      (super.noSuchMethod(Invocation.method(#getDetailOrder, [orderId]),
              returnValue: Future<_i2.Order>.value(_FakeOrder_0()))
          as _i5.Future<_i2.Order>);
  @override
  _i5.Future<_i2.Order> finishOrder(String? orderId) =>
      (super.noSuchMethod(Invocation.method(#finishOrder, [orderId]),
              returnValue: Future<_i2.Order>.value(_FakeOrder_0()))
          as _i5.Future<_i2.Order>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [OrderViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockOrderViewModel extends _i1.Mock implements _i6.OrderViewModel {
  MockOrderViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i7.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);
  @override
  _i5.Stream<_i3.AsyncState<List<_i2.OrderList>>> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.AsyncState<List<_i2.OrderList>>>.empty())
          as _i5.Stream<_i3.AsyncState<List<_i2.OrderList>>>);
  @override
  _i3.AsyncState<List<_i2.OrderList>> get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeAsyncState_1<List<_i2.OrderList>>())
          as _i3.AsyncState<List<_i2.OrderList>>);
  @override
  set state(_i3.AsyncState<List<_i2.OrderList>>? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i3.AsyncState<List<_i2.OrderList>> get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
              returnValue: _FakeAsyncState_1<List<_i2.OrderList>>())
          as _i3.AsyncState<List<_i2.OrderList>>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i7.RemoveListener addListener(
          _i8.Listener<_i3.AsyncState<List<_i2.OrderList>>>? listener,
          {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i7.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
