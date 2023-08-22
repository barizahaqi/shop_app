class ProductRequest {
  ProductRequest({required this.limit, required this.sort});

  String limit;
  String sort;

  factory ProductRequest.fromJson(Map<String, dynamic> json) => ProductRequest(
        limit: json['limit'],
        sort: json['sort'],
      );

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'sort': sort,
      };
}
