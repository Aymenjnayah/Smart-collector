import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size.fromHeight(50),
  primary: AppColor.primary_color,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
