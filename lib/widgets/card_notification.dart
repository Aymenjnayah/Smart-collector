import 'package:flutter/material.dart';
import 'package:smart_collector/config/app_colors.dart';
import 'package:smart_collector/config/values_manager.dart';

import '../config/fonts_manager.dart';
import 'expandable_text_widget.dart';
import 'medium_text_widget.dart';

class CardNotification extends StatelessWidget {
  String title;
  String description;
  String Date;

  CardNotification({super.key,required this.title,required this.description,required this.Date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.hs14,
        horizontal: AppSize.ws14,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary_white_color,
        borderRadius: BorderRadius.circular(AppSize.hs14),
      ),
      child: Stack(
        children: [
          //title and discription
          Container(
            padding: EdgeInsets.only(top: AppPadding.hp16 * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                MediumTextWidget(
                  text: title,
                  color: AppColors.Subtitle,
                  fontWeight: FontWeightManager.semiBold,
                  size: FontSize.fs18,
                ),
                SizedBox(height: AppSize.hs5),
                //description
                ExpandableTextWidget(
                  text:this.description,
                  textSize: FontSize.fs14,
                  maxlines: 2,
                ),
              ],
            ),
          ),
          // icon
          Positioned(
            left: 0,
            top: 0,
            child: Icon(
              Icons.notifications,
              color: AppColors.primary_color,
            ),
          ),
          //date of notificaion
          Positioned(
            right: 0,
            top: 0,
            child: MediumTextWidget(
              text: Date,
              size: FontSize.fs14,
              color: AppColors.primary_color,
            ),
          ),
        ],
      ),
    );
  }
}
