import 'package:eshop_flutter/core/models/order_model.dart';

final product = new Product("Nike 2021", 1000000, "https://astrastar.blob.core.windows.net/image/nike2.png");
final listProduct = <Product>[
  product
];
final dummyOrder = new OrderList("434a6c8c-c892-40df-bf4c-05aa41421e31", "Shipping", "Agustus 31, 2021", "1", 1000000);

final dummyOrderList = <OrderList>[
  dummyOrder,
  dummyOrder
];

final dummyOrderDetail = new Order("434a6c8c-c892-40df-bf4c-05aa41421e31", "Shipping", "Agustus 31, 2021", listProduct, "TUKAD", 1000000, 0, 100000, 1100000, "shipping", "nomorResi", "ekspedisi", 2);