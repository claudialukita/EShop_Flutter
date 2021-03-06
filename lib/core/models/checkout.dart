
class Checkout {
  List<ShoeItems> shoeItemOrder;
  AddressDetail address;

  Checkout(this.shoeItemOrder, this.address);

  factory Checkout.fromJson(dynamic json) {
      var tagObjsJson = json['shoeItemOrder'] as List;
      List<ShoeItems> _shoeItemOrder = tagObjsJson.map((tagJson) => ShoeItems.fromJson(tagJson)).toList();

      return Checkout(
      _shoeItemOrder,
      AddressDetail.fromJson(json['address'])
      );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> address = this.address.toJson();

    List<Map> shoeItemOrder =
        this.shoeItemOrder.map((i) => i.toJson()).toList();

    return {
      'shoeItemOrder': shoeItemOrder,
      'address': address
    };
  }
}

class AddressDetail {
  String street;
  String phoneNumber;
  String receiptName;

  AddressDetail(this.street, this.phoneNumber, this.receiptName);

  AddressDetail.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        phoneNumber = json['phoneNumber'],
        receiptName = json['receiptName'];

  Map<String, dynamic> toJson() => {
        'street': street,
        'phoneNumber': phoneNumber,
        'receiptName': receiptName,
      };
}

class ShoeItems {
  String shoeItemId;
  int quantity;
  double? totalPrice;

  ShoeItems(this.shoeItemId, this.quantity, this.totalPrice);

  ShoeItems.fromJson(Map<String, dynamic> json)
      : shoeItemId = json['shoeItemId'],
        quantity = json['quantity'],
        totalPrice = json['totalPrice'];

  Map<String, dynamic> toJson() => {
        'shoeItemId': shoeItemId,
        'quantity': quantity,
        'totalPrice': totalPrice,
      };
}

class ShoeItemsRes {
  String shoeItemId;
  int quantity;

  ShoeItemsRes(this.shoeItemId, this.quantity);

  ShoeItemsRes.fromJson(Map<String, dynamic> json)
      : shoeItemId = json['shoeItemId'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'shoeItemId': shoeItemId,
        'quantity': quantity
      };
}

class CheckoutResponse {
  int statusCode;
  String message;
  CheckoutRes result;

  CheckoutResponse(this.statusCode, this.message, this.result);

  CheckoutResponse.fromJson(Map<String, dynamic> json)
      : statusCode = json['statusCode'],
        message = json['message'],
        result = CheckoutRes.fromJson(json['result']);

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'message': message,
        'result': result,
      };
}

class CheckoutRes {
  List<ShoeItemsRes> shoeItemOrder;
  AddressDetail address;

  CheckoutRes(this.shoeItemOrder, this.address);

  factory CheckoutRes.fromJson(dynamic json) {
    var tagObjsJson = json['shoeItemOrder'] as List;
    List<ShoeItemsRes> _shoeItemOrder = tagObjsJson.map((tagJson) => ShoeItemsRes.fromJson(tagJson)).toList();

    return CheckoutRes(
        _shoeItemOrder,
        AddressDetail.fromJson(json['address'])
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> address = this.address.toJson();

    List<Map> shoeItemOrder =
    this.shoeItemOrder.map((i) => i.toJson()).toList();

    return {
      'shoeItemOrder': shoeItemOrder,
      'address': address
    };
  }
}