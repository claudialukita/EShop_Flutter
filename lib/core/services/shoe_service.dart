import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constrants.dart';
import 'package:eshop_flutter/core/models/checkout.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoeServiceProvider =
    Provider((ref) => ShoeService(ref.read(dioProvider)));

class ShoeService {
  final Dio _dio;

  ShoeService(this._dio);

  Future<List<ShoeList>> getShoesByKeyword(String keyword) async {
    List<ShoeList> shoes = [];
    List<String> newImageUrls = [];
    //GET {{host}}/shoes?name={{name_keyword}}
    var response =
        await _dio.get('${API_URL_SHOE_SERVICE}/shoes?name=${keyword}');
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

  Future<List<ShoeList>> getAllShoes() async {
    List<ShoeList> shoes = [];
    var response = await _dio.get('${API_URL_SHOE_SERVICE}/shoe');

    if (response.data.length > 0) {
      for (int i = 0; i < response.data['result']['result'].length; i++) {
        ShoeList shoeList = new ShoeList(
          response.data['result']['result'][i]['id'],
          response.data['result']['result'][i]['name'],
          response.data['result']['result'][i]['rating'],
          response.data['result']['result'][i]['price'].toDouble(),
          response.data['result']['result'][i]['imageUrls'],
        );
        shoes.add(shoeList);
      }
    }
    return shoes;
  }

  Future<List<ShoeList>> getAllShoesByKeyword(String keyword) async {
    List<ShoeList> shoes = [];
    var response = await _dio.get('${API_URL_SHOE_SERVICE}/shoe/${keyword}');

    if (response.data.length > 0) {
      for (int i = 0; i < response.data['result']['result'].length; i++) {
        ShoeList shoeList = new ShoeList(
          response.data['result']['result'][i]['id'],
          response.data['result']['result'][i]['name'],
          response.data['result']['result'][i]['rating'],
          response.data['result']['result'][i]['price'].toDouble(),
          response.data['result']['result'][i]['imageUrls'],
        );
        shoes.add(shoeList);
      }
    }
    return shoes;
  }

  Future<ShoeDetail> getShoeDetail(String shoeId) async {
    List<int> shoeSizes = [];
    List<int> shoeColors = [];
    List<String> shoeImageUrls = [];
    List<Stock> listStock = [];
    //GET {{host}}/shoes/{{shoes_id}}
    var response = await _dio.get('${API_URL_SHOE_SERVICE}/shoe/${shoeId}');
    if (response.data.length > 0) {
      for (var shoeStock in response.data['result']['shoeItem']) {
        Stock newStock = new Stock(
          shoeStock['id'],
          shoeStock['size'],
          shoeStock['color'],
          shoeStock['stock'],
          shoeStock['imageUrl'],
        );
        listStock.add(newStock);
      }

      for (var shoeSize in response.data['result']['shoeItem']) {
        if (!shoeSizes.contains(shoeSize['size'])) {
          shoeSizes.add(shoeSize['size']);
        }
      }

      for (var shoeColor in response.data['result']['shoeItem']) {
        var resColor = shoeColor['color'];
        var newColor = resColor.replaceAll('#', 'FF');
        int hexColor = int.parse(newColor, radix: 16);
        shoeColors.add(hexColor);
      }

      for (var shoeImageUrl in response.data['result']['shoeItem']) {
        shoeImageUrls.add(shoeImageUrl['imageUrl']);
      }

      ShoeDetail newShoe = new ShoeDetail(
        response.data['result']['id'],
        response.data['result']['productCode'],
        response.data['result']['name'],
        response.data['result']['rating'],
        response.data['result']['price'].toDouble(),
        shoeImageUrls,
        listStock,
        shoeSizes,
        shoeColors,
      );
      return newShoe;
    } else {
      throw Exception('Shoe not found.');
    }
  }

  Future<CheckoutResponse> postCheckout(Checkout commCheckout) async {
    var response = await _dio.post('${API_URL_CHECKOUT_SERVICE}/checkout',
        data: commCheckout.toJson());
    if (response.data.length > 0) {
      var shoeItemOrder = response.data['result']['shoeItemOrder']
          .map((tagJson) => ShoeItems.fromJson(tagJson))
          .toList();

      CheckoutResponse checkoutResponse = new CheckoutResponse(
          response.data['statusCode'], response.data['message'], shoeItemOrder);

      return checkoutResponse;
    } else {
      throw Exception('Shoe not found.');
    }
  }
}
