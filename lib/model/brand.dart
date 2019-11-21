// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Brand> brandFromJson(String str) => List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  String name;
  String logo;
  String description;

  Brand({
    @required this.name,
    @required this.logo,
    @required this.description,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    name: json["name"],
    logo: json["logo"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "description": description,
  };
}
