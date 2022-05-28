import 'package:flutter/material.dart';

class FoodModel {
  int? id;

  String? name;
  int? price;
  String? description;
  String? image;
  bool? favorite;

  FoodModel({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.image,
    @required this.favorite,
  });

  toMap() {
    return {
      'id': id,
      "name": name,
      "price": price,
      "description": description,
      "image": image,
      "favorite": favorite
    };
  }

  FoodModel.fromJson(Map json){
    this.id = json["id"];
    this.name = json["Name"];
    this.price = json["price"];
    this.description = json["description"];
    this.image = json["image"];
    this.favorite = json["favorite"];
  }
}
