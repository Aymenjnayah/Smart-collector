import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app_colors.dart';
import '../config/values_manager.dart';
import 'medium_text_widget.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  double textSize;
  Color color;
  ButtonWidget(
      {super.key,
      required this.text,
      this.textSize = 20,
      this.color = AppColors.Subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: AppPadding.hp16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.hs10),
      ),
      child: Center(
          child: MediumTextWidget(
        text: text,
        color: Colors.white,
        size: textSize,
      )),
    );
  }
}
