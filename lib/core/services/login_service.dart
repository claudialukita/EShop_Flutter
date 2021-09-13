import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/login_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final loginServiceProvider = Provider(
    (ref) => LoginService(ref.read(dioProvider), ref.read(storageProvider)));

class LoginService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  LoginService(this._dio, this._secureStorage);

  Future<LoginResponse> getLogin(String email, String password) async {
    try {
      LoginModel login = new LoginModel(email, password);
      var response =
          await _dio.post('${API_URL}sign-in-by-email', data: login.toJson());

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
    } catch (e) {
      print("catch error nih");
      throw new Exception(e);
    }
  }
}
