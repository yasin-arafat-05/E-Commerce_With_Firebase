import 'dart:convert';

ProductModel temperaturesFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String temperaturesToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  String name;
  String price;
  String description;
  String status;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        image: json["image"],
        name: json["name"] ?? "",
        price: "23",
        description: "des",
        status: 'k',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
      };
}
