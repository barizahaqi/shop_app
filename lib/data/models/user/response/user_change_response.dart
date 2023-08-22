import 'package:shop_app/data/models/user/user_component.dart';

class UserChangeResponse {
  String email;
  String username;
  String pasword;
  UserName name;
  UserAddress address;
  String phone;

  UserChangeResponse({
    required this.email,
    required this.username,
    required this.pasword,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory UserChangeResponse.fromJson(Map<String, dynamic> json) =>
      UserChangeResponse(
        email: json["email"],
        username: json["username"],
        pasword: json["pasword"],
        name: UserName.fromJson(json["name"]),
        address: UserAddress.fromJson(json["address"]),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "pasword": pasword,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
      };
}
