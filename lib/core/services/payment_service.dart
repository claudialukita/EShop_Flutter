import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constrants.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoeServiceProvider =
    Provider((ref) => PaymentService(ref.read(dioProvider)));

class PaymentService {
  final Dio _dio;

  PaymentService(this._dio);

  Future postCheckout(String shoeId, int qty, String street,
      String phone, String receipentName) async {
    List<String> newImageUrls = [];
    List<int> newSizes = [];
    List<String> newColors = [];

    var address = FormData.fromMap({
      "street": street,
      "phone": phone,
      "receipentName": receipentName,
    });

    var formData = FormData.fromMap({
      "items": [
        {},
      ],
      "address": address
    });

    //GET {{host}}/shoes/{{shoes_id}}
    var response = await _dio.post('${API_URL}/checkout', );
    if (response.data.length > 0) {
      for (var shoeImgRes in response.data['results']['imageUrls']) {
        newImageUrls.add(shoeImgRes);
      }
      for (var shoeSizesRes in response.data['results']['sizes']) {
        newSizes.add(shoeSizesRes);
      }
      for (var shoeColorsRes in response.data['results']['colors']) {
        newColors.add(shoeColorsRes);
      }

      Shoe newShoe = new Shoe(
        response.data['id'],
        response.data['name'],
        response.data['rating'],
        response.data['price'],
        response.data['imageUrls'],
        response.data['productCode'],
        response.data['sizes'],
        response.data['colors'],
        response.data['stocks'],
        response.data['description'],
      );
      return newShoe;
    } else {
      throw Exception('Shoe not found.');
    }
  }
}
