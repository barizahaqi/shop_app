import 'package:shop_app/data/models/cart/cart_item.dart';

class CartResponse {
  int id;
  int userId;
  DateTime date;
  List<CartItem> products;
  int v;

  CartResponse({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<CartItem>.from(
            json["products"].map((x) => CartItem.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
      };
}
