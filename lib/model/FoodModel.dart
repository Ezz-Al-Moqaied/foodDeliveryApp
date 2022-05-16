import 'package:flutter/material.dart';

class FoodModel {
  String? name;
  double? price;
  String? description;
  String? image;
  bool? favorite;

  FoodModel({
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.image,
    @required this.favorite,
  });
}
