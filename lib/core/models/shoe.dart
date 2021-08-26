class ShoeList {
  String id;
  String name;
  int rating;
  double price;
  List<dynamic> imageUrls;

  ShoeList(this.id, this.name, this.rating, this.price, this.imageUrls);
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
