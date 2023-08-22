class ProductChangeResponse {
  int id;
  String title;
  String price;
  String description;
  String image;
  String category;

  ProductChangeResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory ProductChangeResponse.fromJson(Map<String, dynamic> json) =>
      ProductChangeResponse(
        id: json["id"],
        title: json["title"],
        price: json["price"].toString(),
        description: json["description"],
        image: json["image"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      };
}
