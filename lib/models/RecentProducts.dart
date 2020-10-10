// To parse this JSON data, do
//
//     final recentProduct = recentProductFromJson(jsonString);

import 'dart:convert';

List<RecentProduct> recentProductFromJson(String str) =>
    List<RecentProduct>.from(
        json.decode(str).map((x) => RecentProduct.fromJson(x)));

String recentProductToJson(List<RecentProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentProduct {
  RecentProduct({
    this.name,
    this.price,
  });

  String name;
  int price;

  factory RecentProduct.fromJson(Map<String, dynamic> json) => RecentProduct(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
