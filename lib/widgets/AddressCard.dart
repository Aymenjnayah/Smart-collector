import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/fonts_manager.dart';
import '../config/values_manager.dart';
import 'medium_text_widget.dart';

class AddressCard extends StatelessWidget {
  final String city;
  final String town;
  final String street;
  final VoidCallback onClick;

  const AddressCard({
    Key? key,
    required this.city,
    required this.town,
    required this.street,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: EdgeInsets.symmetric(
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
              _locationIcon(),
              _buildDivider(),
              _buildGiftAndDate(),
            ],
          ),
          _buildDeleteButton(() {
            onClick();
          }),
        ],
      ),
    );
  }

  Widget _locationIcon() {
    return Column(
      children: [
        Image.asset(
          "assets/images/location_icon.png",
          width: 30,
          height: 30,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      // Set the desired horizontal margin
      child: SizedBox(
        width: AppSize.ws20,
        height: 80,
        child: const VerticalDivider(color: Colors.grey),
      ),
    );
  }

  Widget _buildGiftAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumTextWidget(
          text: "$city $town",
          size: FontSize.fs16,
          fontWeight: FontWeightManager.semiBold,
        ),
        SizedBox(height: AppSize.hs5),
        MediumTextWidget(
          text: street,
          size: FontSize.fs16,
          fontWeight: FontWeightManager.regular,
        ),
      ],
    );
  }

  Widget _buildDeleteButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.delete,
        size: 35,
        color: AppColors.danger,
      ),
    );
  }
}
