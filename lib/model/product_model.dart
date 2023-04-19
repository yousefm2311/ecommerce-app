import 'package:ecommerce_app/util/extentions.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? image, name, description, size, price,productId;
  Color? color;

  ProductModel({
    this.image,
    this.name,
    this.description,
    this.color,
    this.size,
    this.price,
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    image = json["image"];
    name = json["name"];
    description = json["description"];
    color = HexColor.fromHex(json["color"]);
    size = json["size"];
    price = json["price"];
    productId = json["productId"];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productId' : productId
    };
  }
}
