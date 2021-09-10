
import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/auth.dart';
// import 'package:shop_app/providers/dio_provider.dart';
// import 'package:shop_app/screens/sign_in/sign_in_model.dart';

final signInServiceProvider = Provider((ref) => SignInService(ref.container.read(dioProvider)));

class SignInService {
  final Dio _dio;

  SignInService(this._dio);

  Future<LoginResponse> login(String email, String password) async {
    try{
      LoginModel login = new LoginModel(email, password);
      var response = await _dio.post(
          '${API_URL}sign-in-by-email',data: login.toJson());
      return LoginResponse.fromJson(response.data);
    }catch(err){
      throw err;
    }
  }
}