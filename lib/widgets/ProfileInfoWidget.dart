import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/fonts_manager.dart';
import '../config/values_manager.dart';
import 'medium_text_widget.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String name;
  final String points;
  final String liters;
  final String image;

  ProfileInfoWidget({
    required this.name,
    required this.points,
    required this.liters,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.hp14,
        horizontal: AppPadding.wp10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.primary_color,
            blurRadius: AppSize.hs5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primary_color,
                radius: 25,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: AppSize.ws10),
              MediumTextWidget(
                text: name,
                size: FontSize.fs14,
                fontWeight: FontWeightManager.semiBold,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    size: AppSize.hs25,
                    color: AppColor.primary_color,
                  ),
                  SizedBox(width: AppSize.ws5),
                  MediumTextWidget(
                    text: '$points Points',
                    size: FontSize.fs14,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ],
              ),
              SizedBox(height: AppSize.hs10),
              Row(
                children: [
                  Icon(
                    Icons.water_drop,
                    size: AppSize.hs25,
                    color: AppColor.gold,
                  ),
                  SizedBox(width: AppSize.ws5),
                  MediumTextWidget(
                    text: '$liters Litres',
                    size: FontSize.fs14,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
