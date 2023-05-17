import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/widgets/submit_button.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isDarkBackground;

  const SubmitButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isDarkBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: isDarkBackground ? buttonDark : buttonPrimary,
      onPressed: onPressed,
      child: Text(buttonText, style: GoogleFonts.poppins(fontSize: 16)),
    );
  }
}