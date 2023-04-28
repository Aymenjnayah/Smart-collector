import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isMultiline;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFE9F7EF),
          ),
          child: TextField(
            controller: controller,
            maxLines: isMultiline ? null : 1,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
