import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/fonts_manager.dart';
import '../config/values_manager.dart';
import 'medium_text_widget.dart';

class RequestCard extends StatelessWidget {
  String gift;
  String liters;
  String date;

  RequestCard(
      {super.key,
      required this.liters,
      required this.gift,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.hp20,
        horizontal: AppPadding.wp14,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.hs25),
          boxShadow: [
            BoxShadow(
              color: AppColor.primary_color,
              blurRadius: AppSize.hs10,
              offset: Offset(0, 0),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.water_drop,
                    size: AppSize.hs25,
                    color: AppColor.gold,
                  ),
                  SizedBox(height: AppSize.hs5),
                  MediumTextWidget(
                    text: liters,
                    size: FontSize.fs20,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ],
              ),
              SizedBox(width: AppSize.ws20),
              Container(
                height: AppSize.hs25 * 3,
                width: AppSize.ws5 / 3,
                color: Colors.grey,
              ),
              SizedBox(width: AppSize.ws20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.swap_vert_circle,
                        size: AppSize.hs25,
                        color: AppColor.primary_color,
                      ),
                      SizedBox(
                        width: AppSize.ws10,
                      ),
                      MediumTextWidget(
                        text: gift,
                        size: FontSize.fs18,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.hs5),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: AppSize.hs25,
                        color: AppColor.primary_color,
                      ),
                      SizedBox(
                        width: AppSize.ws10,
                      ),
                      MediumTextWidget(
                        text: date,
                        size: FontSize.fs16,
                        fontWeight: FontWeightManager.regular,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Icon(
            Icons.delete,
            size: AppSize.hs25 * 2,
            color: AppColor.danger,
          )
        ],
      ),
    );
  }
}
