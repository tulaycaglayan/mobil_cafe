import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String imgPath;
  String name;
  String brand;
  String description;
  double price;
  String currency;
  bool isFavorite;

  Product({
    @required this.imgPath,
    @required this.name,
    @required this.brand,
    @required this.description,
    @required this.price,
    @required this.currency,
    @required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    imgPath: json["imgPath"],
    name: json["name"],
    brand: json["brand"],
    description: json["description"],
    price: json["price"].toDouble(),
    currency: json["currency"],
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "imgPath": imgPath,
    "name": name,
    "brand": brand,
    "description": description,
    "price": price,
    "currency": currency,
    "isFavorite": isFavorite,
  };
}