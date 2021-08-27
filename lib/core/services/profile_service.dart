import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';

// import 'package:eshop_flutter/core/common/constrants.dart';

import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/models/profile_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

final profileServiceProvider = Provider(
    (ref) => ProfileService(ref.read(dioProvider), ref.read(storageProvider)));

class ProfileService {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  ProfileService(this._dio, this._secureStorage);

  Future<ProfileModel> getProfile() async {
    DateFormat formatter = DateFormat('dd-MM-yyyy');

    // ProfileModel profile = new ProfileModel("id", "rex4dom@gmail.com", "(307) 555-0133", "passwordEncrypted", "Dominic Ovo", "Male", "12-12-2000", 400, "@dominic_ovo", "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
    // return profile;
    //Url: GET {{host}}/user-info
    var response = await _dio.get('${API_URL}user-info');
    if (response.data.length > 0) {
      if (response.data['result'].length > 0) {
        var stringList =
            response.data['result']['birthday'].toString().split('T');
        var tanggal = DateTime.parse(stringList[0] + " " + stringList[1]);
        String birthday = formatter.format(tanggal);

        var instagramList =
            response.data['result']['instagramUrl'].toString().split("com/");
        String instagram = "@" + instagramList[1];
        ProfileModel profile = new ProfileModel(
            response.data['result']['id'],
            response.data['result']['email'],
            response.data['result']['phone'] == null
                ? ""
                : response.data['result']['phone'],
            // response.data['result']['passwordEncrypted'],
            response.data['result']['name'],
            response.data['result']['gender'] == 0 ? "Male" : "Female",
            birthday,
            double.parse(response.data['result']['point'].toString()),
            instagram,
            response.data['result']['photoUrl'],
            double.parse(response.data['result']['paymentLimit'].toString()));
        return profile;
      } else {
        throw new Exception("Profile tidak ditemukan");
      }
    } else {
      throw new Exception("Profile tidak ditemukan");
    }
  }

  Future<ProfileModel> logOut() async {
    _secureStorage.delete(key: "token");

    ProfileModel profile = new ProfileModel(
        _secureStorage.read(key: "token").toString(),
        "rex4dom@gmail.com",
        "(307) 555-0133",
        "Dominic Ovo",
        "Male",
        "12-12-2000",
        400,
        "@dominic_ovo",
        "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        10);

    return profile;
  }
}
