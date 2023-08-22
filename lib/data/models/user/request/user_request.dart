class UserRequest {
  UserRequest({required this.limit, required this.sort});

  String limit;
  String sort;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        limit: json['limit'],
        sort: json['sort'],
      );

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'sort': sort,
      };
}
