import 'package:shop_app/data/models/cart/cart_item.dart';

class CartChangeResponse {
  int id;
  int userId;
  DateTime date;
  List<CartItem> products;

  CartChangeResponse({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartChangeResponse.fromJson(Map<String, dynamic> json) =>
      CartChangeResponse(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<CartItem>.from(
            json["products"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
