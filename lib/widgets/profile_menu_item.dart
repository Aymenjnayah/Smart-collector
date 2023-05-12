
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.primary_color.withOpacity(0.1),
        ),
        child: Icon(icon, color: AppColors.primary_color),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
      trailing: endIcon
          ? Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.chevron_right,
          size: 30.0,
          color: Color.fromARGB(255, 81, 78, 78),
        ),
      )
          : null,
    );
  }
}