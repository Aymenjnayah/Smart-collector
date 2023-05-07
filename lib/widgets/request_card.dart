import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/fonts_manager.dart';
import '../config/values_manager.dart';
import 'medium_text_widget.dart';

class RequestCard extends StatelessWidget {
  final String gift;
  final String liters;
  final String date;

  const RequestCard({
    Key? key,
    required this.liters,
    required this.gift,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding:  EdgeInsets.symmetric(
        vertical: AppPadding.hp20,
        horizontal: AppPadding.wp14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary_color,
            blurRadius: AppSize.hs5,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildLiters(),
              _buildDivider(),
              _buildGiftAndDate(),
            ],
          ),
          _buildDeleteButton(),
        ],
      ),
    );
  }

  Widget _buildLiters() {
    return Column(
      children: [
        Icon(
          Icons.water_drop,
          size: AppSize.hs25,
          color: AppColors.gold,
        ),
         SizedBox(height: AppSize.hs5),
        MediumTextWidget(
          text: liters,
          size: FontSize.fs20,
          fontWeight: FontWeightManager.semiBold,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return  SizedBox(
      width: AppSize.ws20,
      child: const VerticalDivider(color: Colors.grey),
    );
  }

  Widget _buildGiftAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.swap_vert_circle,
              size: AppSize.hs25,
              color: AppColors.primary_color,
            ),
             SizedBox(width: AppSize.ws10),
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
              color: AppColors.primary_color,
            ),
             SizedBox(width: AppSize.ws10),
            MediumTextWidget(
              text: date,
              size: FontSize.fs16,
              fontWeight: FontWeightManager.regular,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return Icon(
      Icons.delete,
      size: 35,
      color: AppColors.danger,
    );
  }
}
