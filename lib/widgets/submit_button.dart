import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize:  Size.fromHeight(60),
  primary: primary_color,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30),),
  ),
);
