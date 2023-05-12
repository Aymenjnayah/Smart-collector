
import 'package:flutter/material.dart';

Widget buildOption(
    String title,
    String colorHex,
    String imagePath,
    VoidCallback onTap,
    ) {
  final color = Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000);

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 160,
      height: 132,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 64,
            height: 64,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}