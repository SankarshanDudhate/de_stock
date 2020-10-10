// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

import 'dart:convert';

List<Suggestion> suggestionFromJson(String str) =>
    List<Suggestion>.from(json.decode(str).map((x) => Suggestion.fromJson(x)));

String suggestionToJson(List<Suggestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suggestion {
  Suggestion({
    this.name,
    this.price,
    this.description,
  });

  String name;
  int price;
  String description;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
      };
}
