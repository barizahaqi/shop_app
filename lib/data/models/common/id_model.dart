class IdModel {
  String id;

  IdModel({
    required this.id,
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
