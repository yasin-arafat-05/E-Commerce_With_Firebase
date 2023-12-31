// ignore_for_file: override_on_non_overriding_member

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
  bool isFavourite;
  int? quntity;
  ProductModel({
    this.quntity,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavourite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        image: json["image"],
        name: json["name"] ?? "",
        price: json["price"] ?? "",
        description: json["description"] ?? "",
        status: 'k',
        isFavourite: json['isFavourite'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "description": description,
        "status": status,
        "quntity": quntity,
      };

  // To validate the quantity while adding product in cart.
  // for more search -> model copy in flutter.
  @override
  ProductModel copyWith({
    int? quntity,
  }) =>
      ProductModel(
          id: id,
          image: image,
          name: name,
          price: price,
          description: description,
          status: status,
          isFavourite: isFavourite,
          quntity: quntity ?? this.quntity);
}
