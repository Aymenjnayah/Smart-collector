import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_colors.dart';

import '../config/fonts_manager.dart';

class ExpandableTextWidget extends StatelessWidget {
  String text;
  int maxlines;
  double textSize;
  double linkSize;
  Color textColor;
  Color linkColor;
  FontWeight textWeight;

  ExpandableTextWidget({
    super.key,
    required this.text,
    this.maxlines = 3,
    this.textSize = 16,
    this.linkSize = 16,
    this.textColor = AppColors.Subtitle,
    this.linkColor = AppColors.Subtitle,
    this.textWeight = FontWeightManager.regular,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      expandText: 'show more',
      collapseText: ' show less',
      maxLines: maxlines,
      linkColor: linkColor,
      linkStyle: const TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.semiBold),
      style: TextStyle(
          color: textColor,
          fontFamily: FontConstants.fontFamily,
          fontWeight: textWeight,
          fontSize: textSize),
    );
  }
}
