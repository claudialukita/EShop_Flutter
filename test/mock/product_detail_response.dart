import 'dart:convert';

import 'package:eshop_flutter/core/models/shoe.dart';

final dummyShoeDetailStr = {
  "id": "9b8e726f-1ec7-453f-9da5-c4356597d618",
  "productCode": "sepatu-003",
  "name": "Nike 2021",
  "rating": 5,
  "price": 1000000,
  "imageUrls": [
    "https://astrastar.blob.core.windows.net/image/nike2.jpg",
    "https://astrastar.blob.core.windows.net/image/nike2.png",
    "https://astrastar.blob.core.windows.net/image/nike1.jpeg"
  ],
  "shoeItem": [
    {
      "id": "4c353a4e-fdaf-4362-b4b2-a2f27c9e8ec6",
      "size": 44,
      "color": 4294967295,
      "stock": 50,
      "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.jpg"
    },
    {
      "id": "aa366431-9bf4-4df4-af37-ba9a89411b2c",
      "size": 42,
      "color": 4294901760,
      "stock": 34,
      "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.png"
    },
    {
      "id": "e6eee7dd-9fe3-438c-9fff-e2618c29b946",
      "size": 42,
      "color": 4278190080,
      "stock": 3,
      "imageUrl": "https://astrastar.blob.core.windows.net/image/nike1.jpeg"
    }
  ],
  "shoeSizes": [44, 42],
  "shoeColors": [4294967295, 4294901760, 4278190080],
  "description": "Terbuat dari bahan yang terbaik"
};

ShoeDetail dummyShoeDetail = jsonDecode(dummyShoeDetailStr.toString());
String dummyShoeDetailString = jsonEncode(dummyShoeDetail);

final dummyListColor = [4294967295, 4294901760, 4278190080];



