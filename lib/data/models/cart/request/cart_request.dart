class CartRequest {
  CartRequest(
      {required this.limit,
      required this.sort,
      required this.startDate,
      required this.endDate});

  String limit;
  String sort;
  String startDate;
  String endDate;

  factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        limit: json['limit'],
        sort: json['sort'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'sort': sort,
        'startDate': startDate,
        'endDate': endDate,
      };
}
