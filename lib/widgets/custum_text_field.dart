import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_styles.dart';

Widget makeInput({label, icon, obscureText = false, hint, controller, clickable = false}) {
  bool isEnabled = !clickable;
  return TextField(
    controller: controller,
    enabled: isEnabled,
    onTap: clickable ? () => isEnabled = false : null,
    decoration: InputDecoration(
      prefixIcon: SizedBox(
        height: 18,
        width: 18,
        child: icon,
      ),
      hintText: hint,
      hintStyle: GoogleFonts.poppins(),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    ),
  );
}
