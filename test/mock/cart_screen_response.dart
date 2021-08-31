import 'dart:convert';

import 'package:eshop_flutter/core/models/cart.dart';

final summaryCartStr = {
  "listCart": [
    {
      "shoeId": "d334e17e-6cc8-43c5-b3c0-a148361b4286",
      "result": {
        "shoeColor": 4278190080,
        "shoeSize": 41,
        "shoeName": "Puma Black",
        "shoePrice": 100000,
        "shoeImageUrl": "https://astrastar.blob.core.windows.net/image/puma1.jpg",
        "totalShoe": 1
      }
    }
  ],
  "summary": {
    "subTotal": 100000,
    "shippingCost": 40,
    "tax": 10000,
    "totalPrice": 90040
  }
};

SummaryCart dummySummaryCart = jsonDecode(summaryCartStr.toString());

