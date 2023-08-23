import 'package:shop_app/data/models/cart/cart_item.dart';

class CartChangeRequest {
  CartChangeRequest({
    this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  String? id;
  String userId;
  DateTime date;
  List<CartItem> products;

  factory CartChangeRequest.fromJson(Map<String, dynamic> json) =>
      CartChangeRequest(
        id: json['id'],
        userId: json['userId'],
        date: json['date'],
        products: json['products'],
      );

  Map<String, dynamic> toJson() => {
        'userId': int.parse(userId),
        'date': date.toIso8601String(),
        'products': products,
      };
}
