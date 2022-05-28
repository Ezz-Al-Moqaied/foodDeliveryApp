import 'package:flutter/material.dart';

class UserModel {
  String? name;
  String? email;
  int? phone;
  String? address;
  String? password;
  String? confirmpassword;
  List<dynamic>? favorites;

  UserModel({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.address,
    @required this.password,
    @required this.confirmpassword,
    this.favorites,
  });
}
