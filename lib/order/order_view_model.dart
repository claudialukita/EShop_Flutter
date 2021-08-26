
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderViewModelProvider =
StateNotifierProvider<OrderViewModel, AsyncState<List<OrderList>>>(
        (ref) => OrderViewModel(ref.read(orderServiceProvider)));

class OrderViewModel extends StateNotifier<AsyncState<List<OrderList>>> {
  final OrderService _orderService;

  OrderViewModel(this._orderService) : super(Initial([])){
    loadData();
  }

  loadData() async {
    state = Loading(state.data);
    try {
      var shoeList = await _orderService.getOrders();
      print(shoeList);
      state = new Success(shoeList);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}