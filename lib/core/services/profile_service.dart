import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/models/profile_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider =
    Provider((ref) => ProfileService(ref.read(dioProvider)));

class ProfileService {
  final Dio _dio;

  ProfileService(this._dio);

  Future<ProfileModel> getProfile() async {
    List<OrderList> orders = [];

    ProfileModel profile = new ProfileModel("id", "rex4dom@gmail.com", "(307) 555-0133", "passwordEncrypted", "Dominic Ovo", "Male", "12-12-2000", 400, "@dominic_ovo", "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
    return profile;
    //Url: GET {{host}}/user-info
    var response = await _dio.get('${API_URL}/user-info');
    if (response.data.length > 0) {
      if (response.data['result'].length > 0) {
        ProfileModel profile = new ProfileModel(
          response.data['result']['id'],
          response.data['result']['email'],
          response.data['result']['phone'],
          response.data['result']['passwordEncrypted'],
          response.data['result']['name'],
          response.data['result']['gender'],
          response.data['result']['birthday'].toString(),
          double.parse(response.data['result']['point'].toString()),
          response.data['result']['instagramUrl'],
          response.data['result']['photoUrl'],
        );
        return profile;
      } else {
        throw new Exception("Profile tidak ditemukan");
      }
    } else {
      throw new Exception("Profile tidak ditemukan");
    }
  }
}
