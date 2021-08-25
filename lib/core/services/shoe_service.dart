import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constrants.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final shoeServiceProvider =
    Provider((ref) => ShoeService(ref.read(dioProvider)));

class ShoeService {
  final Dio _dio;

  ShoeService(this._dio);

  Future<List<ShoeList>> getShoesByKeyword(String keyword) async {
    List<ShoeList> shoes = [];
    List<String> newImageUrls = [];
    //GET {{host}}/shoes?name={{name_keyword}}
    var response = await _dio.get('${API_URL}/shoes?name=${keyword}');
    if (response.data.length > 0) {
      for (var shoeImgListRes in response.data['results']['imageUrls']) {
        newImageUrls.add(shoeImgListRes);
      }

      for (var shoeListRes in response.data['results']) {
        ShoeList shoeList = new ShoeList(
          shoeListRes['id'],
          shoeListRes['name'],
          shoeListRes['rating'],
          shoeListRes['price'],
          newImageUrls,
        );
        shoes.add(shoeList);
      }
    }
    return shoes;
  }

  Future<Shoe> getShoeDetail(String shoeId) async {
    List<String> newImageUrls = [];
    List<int> newSizes = [];
    List<String> newColors = [];
    //GET {{host}}/shoes/{{shoes_id}}
    var response = await _dio.get('${API_URL}/shoes/${shoeId}');
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
