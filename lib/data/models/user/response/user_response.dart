import 'package:shop_app/data/models/user/user_component.dart';

class UserResponse {
  UserAddress adress;
  int id;
  String email;
  String username;
  String password;
  UserName name;
  String phone;
  int v;

  UserResponse({
    required this.adress,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        adress: UserAddress.fromJson(json["address"]),
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: UserName.fromJson(json["name"]),
        phone: json["phone"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": adress.toJson(),
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "phone": phone,
        "__v": v,
      };
}
