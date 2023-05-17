import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size.fromHeight(50),
  primary: AppColors.primary_color,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);


final ButtonStyle buttonDark = ElevatedButton.styleFrom(
  minimumSize: const Size.fromHeight(50),
  primary: AppColors.blackColor,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);