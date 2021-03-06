class OrderList {
  final String id;
  final String status;
  final String orderDate;
  final String numberOfItems;
  final double totalPrice;

  OrderList(this.id, this.status, this.orderDate, this.numberOfItems,
      this.totalPrice);
}

class Order {
  final String id;
  final String status;
  final String orderDate;
  final List<Product> shoes;
  final String address;
  final double totalItemPrices;
  final double shippingPrice;
  final double tax;
  final double totalPrice;
  final String shipping;
  final String nomorResi;
  final String ekspedisi;
  final int totalItem;

  Order(
      this.id,
      this.status,
      this.orderDate,
      this.shoes,
      this.address,
      this.totalItemPrices,
      this.shippingPrice,
      this.tax,
      this.totalPrice,
      this.shipping,
      this.nomorResi,
      this.ekspedisi, this.totalItem);

}

class Product {
  final String nama;
  final double price;
  final String imageUrls;

  Product(this.nama, this.price, this.imageUrls);
}

class FinishOrder {
  final String orderId;

  FinishOrder(this.orderId);

  FinishOrder.fromJson(Map<String, dynamic> json) :
        orderId = json['orderId'];

  Map<String, dynamic> toJson() =>
      {
        'orderId': orderId,
      };
}
