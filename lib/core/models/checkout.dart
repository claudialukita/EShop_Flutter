class Checkout {
  List<ShoeItems> shoeItemOrder;
  AddressDetail address;

  Checkout(this.shoeItemOrder, this.address);
}

class AddressDetail {
  String street;
  String phoneNumber;
  String receiptName;

  AddressDetail(this.street, this.phoneNumber, this.receiptName);
}

class ShoeItems {
  String shoeItemId;
  int quantity;

  ShoeItems(this.shoeItemId, this.quantity);

  ShoeItems.fromJson(Map<String, dynamic> json)
      : shoeItemId = json['shoeItemId'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
    'shoeItemId': shoeItemId,
    'quantity': quantity,
  };

}
