// To parse this JSON data, do
//
//     final trending = trendingFromJson(jsonString);

import 'dart:convert';

List<Trending> trendingFromJson(String str) =>
    List<Trending>.from(json.decode(str).map((x) => Trending.fromJson(x)));

String trendingToJson(List<Trending> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trending {
  Trending({
    this.name,
    this.price,
  });

  String name;
  int price;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
