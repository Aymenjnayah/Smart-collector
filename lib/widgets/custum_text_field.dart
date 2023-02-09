import 'package:flutter/material.dart';
import '../config/app_styles.dart';

Widget makeInput({label,icon, obscureText = false,hint,controller}) {
  return TextField(
    decoration:  InputDecoration(
      prefixIcon: icon ,
      hintText: hint,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    ),
  );
}