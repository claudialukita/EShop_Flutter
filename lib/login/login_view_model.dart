
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/services/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider =
StateNotifierProvider<LoginViewModel, AsyncState<LoginResponse>>(
        (ref) => LoginViewModel(ref.read(loginServiceProvider)));

class LoginViewModel extends StateNotifier<AsyncState<LoginResponse>> {
  final LoginService _orderService;

  LoginViewModel(this._orderService) : super(Initial(null)){
    // loadData('','');
  }

  loadData(String email, String pass) async {
    state = Loading(state.data);
    try {
      if(email != "" && pass != ""){
        var shoeList = await _orderService.getLogin(email, pass);
        print(shoeList);
        state = new Success(shoeList);
      }
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}