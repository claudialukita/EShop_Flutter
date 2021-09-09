import 'package:eshop_flutter/core/models/shoe.dart';

final dummyShoeInList = ShoeList(
    '7c384e29-49e3-4e29-9539-1b634aaae319',
    'Puma Black',
    5,
    100000,
    ['https://astrastar.blob.core.windows.net/image/puma1.jpg']);

final dummyShoeList = <ShoeList>[
  dummyShoeInList,
  dummyShoeInList,
  dummyShoeInList,
];

final dummyShoeListByKeyword = <ShoeList>[
  dummyShoeInList,
  dummyShoeInList,
];

// final dummyUpcommingRes = LinkedHashSet.from(dummyShoeList);

final dummyShoeListResApi = {
  "statusCode": 200,
  "message": "Success",
  "result": {
    "result": [
      {
        "id": "7c384e29-49e3-4e29-9539-1b634aaae319",
        "name": "Puma Black",
        "rating": 5,
        "price": 100000,
        "imageUrls": [
          "https://astrastar.blob.core.windows.net/image/puma1.jpg"
        ]
      },
      {
        "id": "a001b007-abbf-42e7-bf36-40ec1f881ab9",
        "name": "Adidas Black",
        "rating": 5,
        "price": 500000,
        "imageUrls": [
          "https://astrastar.blob.core.windows.net/image/adidas2.jpg"
        ]
      },
      {
        "id": "9b8e726f-1ec7-453f-9da5-c4356597d618",
        "name": "Nike 2021",
        "rating": 5,
        "price": 1000000,
        "imageUrls": [
          "https://astrastar.blob.core.windows.net/image/nike2.jpg",
          "https://astrastar.blob.core.windows.net/image/nike2.png",
          "https://astrastar.blob.core.windows.net/image/nike1.jpeg"
        ]
      }
    ]
  }
};

final dummyError404ResApi = {
  "statusCode": 404,
  "message": "Shoe Not Found",
  "result": null
};

final dummyShoeListByKeywordResApi = {
  "statusCode": 200,
  "message": "Success",
  "result": {
    "result": [
      {
        "id": "a001b007-abbf-42e7-bf36-40ec1f881ab9",
        "name": "Adidas Black",
        "rating": 5,
        "price": 500000,
        "imageUrls": [
          "https://astrastar.blob.core.windows.net/image/adidas2.jpg"
        ]
      },
      {
        "id": "9b8e726f-1ec7-453f-9da5-c4356597d618",
        "name": "Nike 2021",
        "rating": 5,
        "price": 1000000,
        "imageUrls": [
          "https://astrastar.blob.core.windows.net/image/nike2.jpg",
          "https://astrastar.blob.core.windows.net/image/nike2.png",
          "https://astrastar.blob.core.windows.net/image/nike1.jpeg"
        ]
      }
    ]
  }
};

final dummyShoeDetailResApi = {
  "statusCode": 200,
  "message": "Success",
  "result": {
    "id": "9b8e726f-1ec7-453f-9da5-c4356597d618",
    "productCode": "sepatu-003",
    "name": "Nike 2021",
    "rating": 5,
    "price": 1000000,
    "shoeItem": [
      {
        "id": "4c353a4e-fdaf-4362-b4b2-a2f27c9e8ec6",
        "size": 44,
        "color": "#ffffff",
        "stock": 3,
        "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.jpg",
        "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618"
      },
      {
        "id": "aa366431-9bf4-4df4-af37-ba9a89411b2c",
        "size": 42,
        "color": "#ff0000",
        "stock": 100,
        "imageUrl": "https://astrastar.blob.core.windows.net/image/nike2.png",
        "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618"
      },
      {
        "id": "e6eee7dd-9fe3-438c-9fff-e2618c29b946",
        "size": 42,
        "color": "#000000",
        "stock": 3,
        "imageUrl": "https://astrastar.blob.core.windows.net/image/nike1.jpeg",
        "shoeId": "9b8e726f-1ec7-453f-9da5-c4356597d618"
      }
    ],
    "description": "Terbuat dari bahan yang terbaik"
  }
};

