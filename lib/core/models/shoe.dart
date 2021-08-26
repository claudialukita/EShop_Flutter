class ShoeList {
  String id;
  String name;
  int rating;
  double price;
  List<dynamic> imageUrls;

  ShoeList(this.id, this.name, this.rating, this.price, this.imageUrls);

  factory ShoeList.fromJson(dynamic json) {
    var tagObjsJson = json['imageUrls'] as List;
    List<dynamic> _imageUrls = tagObjsJson.map((tagJson) => tagJson).toList();

    return ShoeList(
        json['id'] as String,
        json['name'] as String,
        json['rating'] as int,
        json['price'] as double,
        _imageUrls
    );
  }

  Map<String, dynamic> toJson() {

    List<dynamic> imageUrls =
    this.imageUrls.map((i) => i.toJson()).toList();

    return {
      'id': id,
      'name': name,
      'rating': rating,
      'price': price,
      'imageUrls': imageUrls
    };
  }

}

class ShoeListResult{
  List<ShoeList> result;

  ShoeListResult(this.result);

  factory ShoeListResult.fromJson(dynamic json) {
    var tagObjsJson = json['shoeItemOrder'] as List;
    List<ShoeList> _shoeItemOrder = tagObjsJson.map((tagJson) => ShoeList.fromJson(tagJson)).toList();

    return ShoeListResult(
        _shoeItemOrder,
    );
  }

}

class ShoeListResponse {
  int statusCode;
  String message;
  ShoeListResult result;

  ShoeListResponse(this.statusCode, this.message, this.result);

}

class Shoe extends ShoeList {
  String productCode;
  List<int> sizes;
  List<String> colors;
  Stock stocks;
  String description;

  Shoe(String id, String name, int rating, double price, List<String> imageUrls,
      this.productCode, this.sizes, this.colors, this.stocks, this.description)
      : super(id, name, rating, price, imageUrls);
}

class ShoeDetail {
  String id;
  String productCode;
  String name;
  int rating;
  double price;
  List<String> imageUrls;
  List<Stock> shoeItem;
  List<int> shoeSizes;
  List<int> shoeColors;

  ShoeDetail(this.id, this.productCode, this.name, this.rating, this.price, this.imageUrls, this.shoeItem, this.shoeSizes, this.shoeColors);
}

class Stock {
  String id;
  int size;
  String color;
  int stock;
  String imageUrl;

  Stock(this.id, this.size, this.color, this.stock, this.imageUrl);
}

class ShoeIdName {
  String shoeId;
  String shoeName;

  ShoeIdName(this.shoeId, this.shoeName);
}

class ShoeColorSize {
  int shoeColor;
  int shoeSize;

  ShoeColorSize(this.shoeColor, this.shoeSize);

}
