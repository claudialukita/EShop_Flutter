import 'package:eshop_flutter/core/models/order_model.dart';

final product = new Product("Puma Black", 100000,
    "https://astrastar.blob.core.windows.net/image/puma1.jpg");
final product1 = new Product("Nike 2021", 1000000,
    "https://astrastar.blob.core.windows.net/image/nike2.jpg");
final listProduct = <Product>[product, product1];
final dummyOrder = new OrderList("434a6c8c-c892-40df-bf4c-05aa41421e31",
    "Shipping", "Agustus 31, 2021", "1", 1000000);

final dummyOrderList = <OrderList>[dummyOrder, dummyOrder, dummyOrder];

final dummyOrderListApi = {
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "id": "25e42dd9-62d2-4a43-be0d-caa89f812e6f",
      "userId": "bef1d4c3-9cd0-48a6-981c-00148c839bc0",
      "status": 1,
      "orderDate": "2021-09-01T11:11:22.6783677",
      "totalItemPrice": 3000000,
      "shippingPrice": 40,
      "tax": 300000,
      "totalPrice": 3300040,
      "address": {
        "orderId": "25e42dd9-62d2-4a43-be0d-caa89f812e6f",
        "street": "jalan 1",
        "phone": "081339631789",
        "recipientName": "riokurtinus"
      },
      "shoeItems": [
        {
          "orderId": "25e42dd9-62d2-4a43-be0d-caa89f812e6f",
          "shoeItemId": "d334e17e-6cc8-43c5-b3c0-a148361b4286",
          "quantity": 30,
          "size": 41,
          "color": "#000000",
          "shoeId": "7c384e29-49e3-4e29-9539-1b634aaae319",
          "productCode": "",
          "name": "Puma Black",
          "price": 100000,
          "description": "Descriptionnnnn",
          "imageUrl": "https://astrastar.blob.core.windows.net/image/puma1.jpg"
        }
      ],
      "shipping": null
    },
    {
      "id": "b60971a2-5e74-4a7a-b05f-1199ef26136b",
      "userId": "bef1d4c3-9cd0-48a6-981c-00148c839bc0",
      "status": 2,
      "orderDate": "2021-09-01T10:05:41.3078722",
      "totalItemPrice": 1000000,
      "shippingPrice": 40,
      "tax": 100000,
      "totalPrice": 1100040,
      "address": {
        "orderId": "b60971a2-5e74-4a7a-b05f-1199ef26136b",
        "street": "2809 Spring Hill Rd Tallahassee, Nevada 52874 United States",
        "phone": "+99 1234562809",
        "recipientName": "Ahmad Khaidir"
      },
      "shoeItems": [
        {
          "orderId": "b60971a2-5e74-4a7a-b05f-1199ef26136b",
          "shoeItemId": "aa366431-9bf4-4df4-af37-ba9a89411b2c",
          "quantity": 1,
          "size": 42,
          "color": "#ff0000",
          "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618",
          "productCode": "",
          "name": "Nike 2021",
          "price": 1000000,
          "description": "Descriptionnnnn",
          "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.png"
        }
      ],
      "shipping": null
    },
    {
      "id": "df003d8f-74f8-4c60-91c5-b04429a35e36",
      "userId": "bef1d4c3-9cd0-48a6-981c-00148c839bc0",
      "status": 1,
      "orderDate": "2021-09-01T10:05:40.7290585",
      "totalItemPrice": 1000000,
      "shippingPrice": 40,
      "tax": 100000,
      "totalPrice": 1100040,
      "address": {
        "orderId": "df003d8f-74f8-4c60-91c5-b04429a35e36",
        "street": "2809 Spring Hill Rd Tallahassee, Nevada 52874 United States",
        "phone": "+99 1234562809",
        "recipientName": "Ahmad Khaidir"
      },
      "shoeItems": [
        {
          "orderId": "df003d8f-74f8-4c60-91c5-b04429a35e36",
          "shoeItemId": "aa366431-9bf4-4df4-af37-ba9a89411b2c",
          "quantity": 1,
          "size": 42,
          "color": "#ff0000",
          "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618",
          "productCode": "",
          "name": "Nike 2021",
          "price": 1000000,
          "description": "Descriptionnnnn",
          "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.png"
        }
      ],
      "shipping": null
    }
  ]
};

final dummyOrderDetail = new Order(
    "510fd0f3-a21e-41de-a23a-82a55b41e739",
    "Finished",
    "August 26, 2021",
    listProduct,
    "TUKAD2",
    1100000,
    0,
    110000,
    1210000,
    "",
    "",
    "",
    2);

final dummyOrderDetailApi = {
  "statusCode": 200,
  "message": "Success",
  "result": {
    "id": "510fd0f3-a21e-41de-a23a-82a55b41e739",
    "userId": "bef1d4c3-9cd0-48a6-981c-00148c839bc0",
    "status": 2,
    "orderDate": "2021-08-26T17:35:03.1908762",
    "totalItemPrice": 1100000,
    "shippingPrice": 0,
    "tax": 110000,
    "totalPrice": 1210000,
    "address": {
      "orderId": "510fd0f3-a21e-41de-a23a-82a55b41e739",
      "street": "TUKAD",
      "phone": "222221233344",
      "recipientName": "TUKAD2"
    },
    "shoeItems": [
      {
        "orderId": "510fd0f3-a21e-41de-a23a-82a55b41e739",
        "shoeItemId": "d334e17e-6cc8-43c5-b3c0-a148361b4286",
        "quantity": 1,
        "size": 41,
        "color": "#000000",
        "shoeId": "7c384e29-49e3-4e29-9539-1b634aaae319",
        "productCode": "",
        "name": "Puma Black",
        "price": 100000,
        "description": "Descriptionnnnn",
        "imageUrl": "https://astrastar.blob.core.windows.net/image/puma1.jpg"
      },
      {
        "orderId": "510fd0f3-a21e-41de-a23a-82a55b41e739",
        "shoeItemId": "aa366431-9bf4-4df4-af37-ba9a89411b2c",
        "quantity": 2,
        "size": 42,
        "color": "#ff0000",
        "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618",
        "productCode": "",
        "name": "Nike 2021",
        "price": 1000000,
        "description": "Descriptionnnnn",
        "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.jpg"
      }
    ],
    "shipping": null
  }
};
