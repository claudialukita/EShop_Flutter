import 'package:dio/dio.dart';
import 'package:eshop_flutter/core/common/constrants.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/core/providers/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderServiceProvider =
    Provider((ref) => OrderService(ref.read(dioProvider)));

class OrderService {
  final Dio _dio;

  OrderService(this._dio);

  Future<List<OrderList>> getOrders() async {
    List<OrderList> orders = [];

    // GET {{host}}/orders
    // var response = await _dio.get('${API_URL}/orders');
    // if (response.data.length > 0) {
    //
    //   for (var orderListTemp in response.data['results']) {
    //     OrderList orderList = new OrderList(
    //       orderListTemp['id'],
    //         orderListTemp['status'],
    //         orderListTemp['orderDate'].toString(),
    //         orderListTemp['numberOfItems'],
    //         double.parse(orderListTemp['totalPrice'].toString()),
    //     );
    //     orders.add(orderList);
    //   }
    // }

    OrderList order = new OrderList(
        "IDORDER", "Shipping", "August 1, 2017", "2", double.parse("299.43"));
    OrderList order1 = new OrderList(
        "IDORDER1", "Processed", "August 2, 2017", "1", double.parse("29.43"));
    OrderList order2 = new OrderList(
        "IDORDER2", "Finished", "August 3, 2017", "3", double.parse("99.43"));
    orders.add(order);
    orders.add(order1);
    orders.add(order2);
    return orders;
  }

  Future<Order> getDetailOrder(String orderId) async {
    List<Product> product = [];
    List<String> image = [];
    List<String> images = [];
    image.add("https://cdn.runrepeat.com/i/nike/36676/nike-air-zoom-pegasus-37-shield-black-pink-blast-iron-grey-obsidian-mist-men-s-running-shoes-black-pink-blast-iron-grey-obsidian-mist-adult-black-pink-blast-iron-grey-obsidian-mist-7022-600.jpg");
    images.add("https://images.tokopedia.net/img/cache/500-square/product-1/2020/8/20/2349390/2349390_52810f50-909c-46e1-8707-7bbbbde6174d_1080_1080");
    Product prod = new Product("Nike Air Zoom Pegasus 36 Miami", 29, image);
    Product prod1 = new Product("Nike Air Zoom Pegasus 36 Miami", 29, images);

    product.add(prod);
    product.add(prod1);
    product.add(prod1);
    Order newOrder = Order("id", "Shipping", "January 16, 2020", product, "address", 598.86, 40.00, 10.00, 766.86, "January 16, 2020", "000192848573s", "POS Reggular");

    return newOrder;
    //GET {{host}}/orders/{{order_id}}
    // var response = await _dio.get('${API_URL}/orders/${orderId}');
    // if (response.data.length > 0) {
    //   if (response.data['result'].length > 0) {
    //     for (var productTemp in response.data['result']['shoes']) {
    //       Product newProduct = Product(productTemp['name'],
    //           double.parse(productTemp['price'].toString()), productTemp['imageUrls']);
    //       product.add(newProduct);
    //     }
    //     Order newOrder = new Order(
    //         response.data['result']['id'],
    //         response.data['result']['status'],
    //         response.data['result']['orderDate'].toString(),
    //         product,
    //         response.data['result']['address'],
    //         double.parse(response.data['result']['totalItemPrices'].toString()),
    //         double.parse(response.data['result']['shippingPrice'].toString()),
    //         double.parse(response.data['result']['tax'].toString()),
    //         double.parse(response.data['result']['tax'].toString()),
    //         response.data['result']['shipping']['shippingDate'].toString(),
    //         response.data['result']['nomorResi'],
    //         response.data['result']['ekspedisi']);
    //     return newOrder;
    //   } else {
    //     throw Exception('Order Detail not found.');
    //   }
    // } else {
    //   throw Exception('Order Detail not found.');
    // }
  }
}
