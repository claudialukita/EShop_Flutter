

import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/services/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginValidationViewModelProvider =
StateNotifierProvider<LoginValidationViewModel, LoginValidation>(
        (ref) => LoginValidationViewModel());

class LoginValidationViewModel extends StateNotifier<LoginValidation> {
  // final LoginService _orderService;
  // LoginValidation validation = new LoginValidation(false, false);
  LoginValidationViewModel() : super(new LoginValidation(false, false)){
    // loadData('','');
  }

  setValidate(String email, String pass) async {
    if(email == "" && pass == ""){
      state = new LoginValidation(true, true);
    }else if(email != "" && pass == ""){
      state = new LoginValidation(false, true);
    }else if(email == "" && pass != ""){
      state = new LoginValidation(true, false);
    }
  }

}