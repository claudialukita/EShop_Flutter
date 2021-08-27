
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailViewModelProvider =
StateNotifierProvider<OrderDetailViewModel, AsyncState<Order>>(
        (ref) => OrderDetailViewModel(ref.read(orderServiceProvider)));

class OrderDetailViewModel extends StateNotifier<AsyncState<Order>> {
  final OrderService _orderService;

  OrderDetailViewModel(this._orderService) : super(Initial(null)){
    loadData('');
  }

  loadData(String id) async {
    state = Loading(state.data);
    try {
      var order = await _orderService.getDetailOrder(id);
      print(order);
      state = new Success(order);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  finishOrder(String id) async {
    state = Loading(state.data);
    try {
      var order = await _orderService.finishOrder(id);
      print(order);
      state = new Success(order);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}