class Cart{
  String shoeColor;
  int shoeSize;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  int totalShoe;
  Cart(this.shoeColor, this.shoeSize, this.shoeName, this.shoePrice, this.shoeImageUrl, this.totalShoe);

  Cart.fromJson(Map<String, dynamic> json)
      : shoeColor = json['shoeColor'],
        shoeSize = json['shoeSize'],
        shoeName = json['shoeName'],
        shoePrice = json['shoePrice'],
        shoeImageUrl = json['shoeImageUrl'],
        totalShoe = json['totalShoe'];

  Map<String, dynamic> toJson() => {
    'shoeColor': shoeColor,
    'shoeSize': shoeSize,
    'shoeName': shoeName,
    'shoePrice': shoePrice,
    'shoeImageUrl': shoeImageUrl,
    'totalShoe': totalShoe,
  };
}

class ShoeInCart {
  String shoeId;
  Cart result;

  ShoeInCart(this.shoeId, this.result);

  ShoeInCart.fromJson(Map<String, dynamic> json)
      : shoeId = json['shoeId'],
        result = Cart.fromJson(json['result']);

  Map<String, dynamic> toJson() => {
    'shoeId': shoeId,
    'result': result,
  };
}

class ShoePrice{
  int totalShoe;
  double shoePrice;

  ShoePrice(this.totalShoe, this.shoePrice);

  ShoePrice.fromJson(Map<String, dynamic> json)
      : totalShoe = json['totalShoe'],
        shoePrice = json['shoePrice'];

  Map<String, dynamic> toJson() => {
    'totalShoe': totalShoe,
    'shoePrice': shoePrice,
  };
}

class Summary{
  double subTotal;
  double shippingCost;
  double tax;
  double totalPrice;

  Summary(this.subTotal, this.shippingCost, this.tax, this.totalPrice);
}
