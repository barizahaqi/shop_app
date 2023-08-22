class ProductCategoryRequest {
  ProductCategoryRequest({required this.category});

  String category;

  factory ProductCategoryRequest.fromJson(Map<String, dynamic> json) =>
      ProductCategoryRequest(
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'category': category,
      };
}
