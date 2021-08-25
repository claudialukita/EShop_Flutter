class Cart{
  String shoeColor;
  String shoeSize;
  String shoeId;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  Cart(this.shoeColor, this.shoeSize, this.shoeId, this.shoeName, this.shoePrice, this.shoeImageUrl);
}

class Summary{
  double subTotal;
  double shippingCost;
  double tax;
  double totalPrice;

  Summary(this.subTotal, this.shippingCost, this.tax, this.totalPrice);
}