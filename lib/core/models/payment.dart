class ShoeItem {
  String shoeId;
  int qty;

  ShoeItem(this.shoeId, this.qty);

}

class Address {
  String street;
  String phone;
  String receipentName;

  Address(this.street, this.phone, this.receipentName);
}

class Checkout{
  List<ShoeItem> items;
  Address address;

  Checkout(this.items, this.address);
}
