import 'package:eshop_flutter/core/models/order_model.dart';

final product = new Product("Puma Black", 100000, "https://astrastar.blob.core.windows.net/image/puma1.jpg");
final product1 = new Product("Nike 2021", 1000000, "https://astrastar.blob.core.windows.net/image/nike2.jpg");
final listProduct = <Product>[
  product,
  product1
];
final dummyOrder = new OrderList("434a6c8c-c892-40df-bf4c-05aa41421e31", "Shipping", "Agustus 31, 2021", "1", 1000000);

final dummyOrderList = <OrderList>[
  dummyOrder,
  dummyOrder
];

final dummyOrderDetail = new Order("510fd0f3-a21e-41de-a23a-82a55b41e739", "Finished", "August 26, 2021", listProduct, "TUKAD2", 1100000, 0, 110000, 1210000, "", "", "", 2);