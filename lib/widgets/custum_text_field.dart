import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_styles.dart';


Widget makeInput({label,icon, obscureText = false,hint,controller}) {
  return TextField(
    decoration:  InputDecoration(
      prefixIcon: icon ,
      hintText: hint, hintStyle: GoogleFonts.poppins(),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    ),
  );
}