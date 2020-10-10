// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.available,
    this.categoryId,
    this.details,
    this.id,
    this.location,
    this.minQty,
    this.name,
    this.price,
    this.priceDisclose,
    this.soldCount,
    this.specifications,
    this.subCategoryId,
    this.unit,
    this.views,
  });

  bool available;
  int categoryId;
  String details;
  int id;
  String location;
  int minQty;
  String name;
  int price;
  bool priceDisclose;
  int soldCount;
  String specifications;
  int subCategoryId;
  String unit;
  int views;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        categoryId: json["category_id"],
        details: json["details"],
        id: json["id"],
        location: json["location"],
        minQty: json["minQty"],
        name: json["name"],
        price: json["price"],
        priceDisclose: json["priceDisclose"],
        soldCount: json["soldCount"],
        specifications: json["specifications"],
        subCategoryId: json["subCategory_id"],
        unit: json["unit"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "category_id": categoryId,
        "details": details,
        "id": id,
        "location": location,
        "minQty": minQty,
        "name": name,
        "price": price,
        "priceDisclose": priceDisclose,
        "soldCount": soldCount,
        "specifications": specifications,
        "subCategory_id": subCategoryId,
        "unit": unit,
        "views": views,
      };
}
