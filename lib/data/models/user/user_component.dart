class UserAddress {
  UserLocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  UserAddress({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        geolocation: UserLocation.fromJson(json["geolocation"]),
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "geolocation": geolocation.toJson(),
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
      };
}

class UserLocation {
  String lat;
  String long;

  UserLocation({
    required this.lat,
    required this.long,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class UserName {
  String firstname;
  String lastname;

  UserName({
    required this.firstname,
    required this.lastname,
  });

  factory UserName.fromJson(Map<String, dynamic> json) => UserName(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
