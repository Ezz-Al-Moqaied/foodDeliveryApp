import 'package:flutter/material.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required String label,
  IconData? prefixIcon,
  TextInputType? keyboardType,
  IconData? suffix,
}) =>
    TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration:  InputDecoration(
        focusColor: Colors.deepOrange,
        label: Text(label),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffix),
        border:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );