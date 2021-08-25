class ShoeList {
  String id;
  String name;
  int rating;
  double price;
  List<String> imageUrls;

  ShoeList(this.id, this.name, this.rating, this.price, this.imageUrls);
}

class Shoe extends ShoeList {
  // String id;
  String productCode;
  // String name;
  // int rating;
  // double price;
  List<int> sizes;
  List<String> colors;
  Stock stocks;
  // List<String> imageUrls;
  String description;

  Shoe(String id, String name, int rating, double price, List<String> imageUrls,
      this.productCode, this.sizes, this.colors, this.stocks, this.description)
      : super(id, name, rating, price, imageUrls);
}

class Stock {
  int size;
  String color;
  int stock;

  Stock(this.size, this.color, this.stock);
}
