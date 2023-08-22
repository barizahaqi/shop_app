class ProductChangeRequest {
  ProductChangeRequest({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  String? id;
  String title;
  String price;
  String description;
  String image;
  String category;

  factory ProductChangeRequest.fromJson(Map<String, dynamic> json) =>
      ProductChangeRequest(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        image: json['image'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      };
}
