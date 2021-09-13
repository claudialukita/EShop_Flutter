
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/auth.dart';
// import 'package:shop_app/providers/dio_provider.dart';
// import 'package:shop_app/screens/sign_in/sign_in_model.dart';

final signInServiceProvider = Provider((ref) => SignInService(ref.container.read(dioProvider), ref.read(storageProvider)));

class SignInService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  SignInService(this._dio, this._secureStorage);

  Future<LoginResponse> login(String email, String password) async {
    try{
      LoginModel login = new LoginModel(email, password);
      var response = await _dio.post(
          '${API_URL}sign-in-by-email',data: login.toJson());
      if (response.data.length > 0) {
        if (response.data['message'] == "Success") {
          LoginResponse logins = new LoginResponse(response.data['message']);
          _secureStorage.write(
              key: "token", value: response.data['result']['accessToken']);
          return logins;
        } else {
          LoginResponse logins = new LoginResponse(response.data['message']);
          return logins;
        }
      }
      LoginResponse logins = new LoginResponse("Gagal Login");
      return logins;
      // return LoginResponse.fromJson(response.data);
    }catch(err){
      throw err;
    }
  }
}