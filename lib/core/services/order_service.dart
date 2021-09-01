import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constant.dart';
// import 'package:eshop_flutter/core/common/constrants.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final orderServiceProvider =
    Provider((ref) => OrderService(ref.read(dioProvider)));

class OrderService {
  final Dio _dio;

  OrderService(this._dio);

  Future<List<OrderList>> getOrders() async {
    try {
      List<OrderList> orders = [];
      DateFormat formatter = DateFormat.yMMMMd('en_US');

      // GET {{host}}/orders
      var response = await _dio.get('${API_URL_ORDER}orders');
      if (response.data.length > 0) {
        if (response.data['result'].length > 0) {
          for (var orderListTemp in response.data['result']) {
            int totalItem = 0;
            for (var b in orderListTemp['shoeItems']) {
              totalItem += 1;
            }
            var stringList = orderListTemp['orderDate'].toString().split('T');
            var tanggal = DateTime.parse(stringList[0] + " " + stringList[1]);
            String orderdate = formatter.format(tanggal);
            OrderList orderList = new OrderList(
              orderListTemp['id'],
              orderListTemp['status'] == 0
                  ? "Processed"
                  : orderListTemp['status'] == 1
                  ? "Shipping"
                  : "Finished",
              orderdate,
              totalItem.toString(),
              double.parse(orderListTemp['totalItemPrice'].toString()),
            );
            orders.add(orderList);
          }
        }
      }
      return orders;
    }catch(e){
      throw new Exception(e);
    }
  }

  Future<Order> getDetailOrder(String orderId) async {
    try{
      List<Product> product = [];
      var stringList = [];
      var tanggal = null;
      DateFormat formatter = DateFormat.yMMMMd('en_US');
      final oCcy = new NumberFormat("#,##0.00", "en_US");
      double total = 0;
      // image.add("https://cdn.runrepeat.com/i/nike/36676/nike-air-zoom-pegasus-37-shield-black-pink-blast-iron-grey-obsidian-mist-men-s-running-shoes-black-pink-blast-iron-grey-obsidian-mist-adult-black-pink-blast-iron-grey-obsidian-mist-7022-600.jpg");
      // images.add("https://images.tokopedia.net/img/cache/500-square/product-1/2020/8/20/2349390/2349390_52810f50-909c-46e1-8707-7bbbbde6174d_1080_1080");
      // Product prod = new Product("Nike Air Zoom Pegasus 36 Miami", 29, image);
      // Product prod1 = new Product("Nike Air Zoom Pegasus 36 Miami", 29, images);
      //
      // product.add(prod);
      // product.add(prod1);
      // product.add(prod1);
      // Order newOrder = Order("id", "Finished", "January 16, 2020", product, "address", 598.86, 40.00, 10.00, 766.86, "January 16, 2020", "000192848573s", "POS Reggular");
      //
      // return newOrder;
      //GET {{host}}/orders/{{order_id}}
      var response = await _dio.get('${API_URL_ORDER}orders/${orderId}');

      if (response.data.length > 0) {
        if (response.data['result'].length > 0) {
          for (var shoe in response.data['result']['shoeItems']) {
            total += 1;
            Product newProduct = Product(
                shoe['name'],
                // double.parse("1000.02"),
                double.parse(shoe['price'].toString()),
                shoe['imageUrl'].toString());
            product.add(newProduct);
          }

          if (response.data['result']['shipping'] != null) {
            stringList = response.data['result']['shipping']['shippingDate']
                .toString()
                .split('T');
            tanggal = DateTime.parse(stringList[0] + " " + stringList[1]);
          }

          Order newOrder = new Order(
              response.data['result']['id'],
              response.data['result']['status'] == 0
                  ? "Processed"
                  : response.data['result']['status'] == 1
                  ? "Shipping"
                  : "Finished",
              response.data['result']['orderDate'].toString(),
              product,
              response.data['result']['address']['street'],
              (double.parse(response.data['result']['totalItemPrice'].toString()))
                  .floorToDouble(),
              double.parse(response.data['result']['shippingPrice'].toString())
                  .floorToDouble(),
              double.parse(response.data['result']['tax'].toString())
                  .floorToDouble(),
              double.parse(response.data['result']['totalPrice'].toString()),
              tanggal == null ? "" : formatter.format(tanggal),
              response.data['result']['shipping'] == null
                  ? ""
                  : response.data['result']['shipping']['nomorResi'] == null
                  ? ""
                  : response.data['result']['shipping']['nomorResi'],
              response.data['result']['shipping'] == null
                  ? ""
                  : response.data['result']['shipping']['providerName'] == null
                  ? ""
                  : response.data['result']['shipping']['providerName'],
              total.floor());
          return newOrder;
        } else {
          throw Exception('Order Detail not found.');
        }
      } else {
        throw Exception('Order Detail not found.');
      }
    }catch(Exceptions){
     print(Exceptions);
     throw new Exception('Order Detail not found.');
    }
  }

  Future<Order> finishOrder(String orderId) async {
    FinishOrder order = new FinishOrder(orderId);

    var response =
        await _dio.post('${API_URL_ORDER}complete-order', data: order.toJson());

    if (response.data.length > 0) {
      if (response.data['message'] == "Success") {
        Future<Order> orders = getDetailOrder(orderId);
        return orders;
      } else {
        throw new Exception("Finish Order gagal");
      }
    } else {
      throw new Exception("Finish Order gagal");
    }
  }
}
