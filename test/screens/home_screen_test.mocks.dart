// Mocks generated by Mockito 5.0.11 from annotations
// in moviedb/test/screens/movie_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:eshop_flutter/core/models/async_state.dart' as _i2;
import 'package:eshop_flutter/core/models/shoe.dart' as _i3;
import 'package:eshop_flutter/home/view_model/home_view_model.dart'
as _i4;
import 'package:state_notifier/state_notifier.dart' as _i5;
import 'package:eshop_flutter/core/services/shoe_service.dart' as _i7;

class _FakeAsyncState<T> extends _i1.Fake implements _i2.AsyncState<T> {}

class MockShoeService extends _i1.Mock implements _i7.ShoeService {
  MockShoeService() {
    _i1.throwOnMissingStub(this);
  }
  @override
  _i6.Future<List<_i3.ShoeList>> getAllShoes() =>
      (super.noSuchMethod(Invocation.method(#getShoeList, null),
          returnValue: Future<List<_i3.ShoeList>>.value(<_i3.ShoeList>[]))
      as _i6.Future<List<_i3.ShoeList>>);
  @override
  _i6.Future<List<_i3.ShoeList>> getShoesByKeyword(String? keyword) =>
      (super.noSuchMethod(Invocation.method(#getShoesByKeyword, [keyword]),
          returnValue: Future<List<_i3.ShoeList>>.value(<_i3.ShoeList>[]))
      as _i6.Future<List<_i3.ShoeList>>);
}

class MockShoeGridViewModel extends _i1.Mock
    implements _i4.ShoeGridViewModel {
  MockShoeGridViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set onError(_i5.ErrorListener? _onError) =>
      super.noSuchMethod(Invocation.setter(#onError, _onError),
          returnValueForMissingStub: null);
  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
      as bool);
  @override
  _i6.Stream<_i2.AsyncState<List<_i3.ShoeList>>> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
          returnValue: Stream<_i2.AsyncState<List<_i3.ShoeList>>>.empty())
      as _i6.Stream<_i2.AsyncState<List<_i3.ShoeList>>>);
  @override
  _i2.AsyncState<List<_i3.ShoeList>> get state =>
      (super.noSuchMethod(Invocation.getter(#state),
          returnValue: _FakeAsyncState<List<_i3.ShoeList>>())
      as _i2.AsyncState<List<_i3.ShoeList>>);
  @override
  set state(_i2.AsyncState<List<_i3.ShoeList>>? value) =>
      super.noSuchMethod(Invocation.setter(#state, value),
          returnValueForMissingStub: null);
  @override
  _i2.AsyncState<List<_i3.ShoeList>> get debugState =>
      (super.noSuchMethod(Invocation.getter(#debugState),
          returnValue: _FakeAsyncState<List<_i3.ShoeList>>())
      as _i2.AsyncState<List<_i3.ShoeList>>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
      as bool);
  @override
  void loadData() => super.noSuchMethod(Invocation.method(#loadData, []),
      returnValueForMissingStub: null);
  @override
  _i5.RemoveListener addListener(
      _i5.Listener<_i2.AsyncState<List<_i3.ShoeList>>>? listener,
      {bool? fireImmediately = true}) =>
      (super.noSuchMethod(
          Invocation.method(
              #addListener, [listener], {#fireImmediately: fireImmediately}),
          returnValue: () {}) as _i5.RemoveListener);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
