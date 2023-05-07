import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/values_manager.dart';
import '../widgets/medium_text_widget.dart';

class AmountInput extends StatelessWidget {
  final String value;

  const AmountInput({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumTextWidget(
          text: "Amount (L)",
          color: AppColors.Subtitle,
          size: FontSize.fs18,
        ),
        SizedBox(height: AppSize.hs10),
        Row(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                height: AppSize.hs20 * 3,
                decoration: BoxDecoration(
                  color: AppColors.primary_color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.hs18),
                    bottomLeft: Radius.circular(AppSize.hs18),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.whiteHoly,
                  size: AppSize.hs14 * 2,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                height: AppSize.hs20 * 3,
                color: AppColors.greyOne,
                child: Center(
                  child: MediumTextWidget(
                    text: value,
                    color: AppColors.Subtitle,
                    size: FontSize.fs18,
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                height: AppSize.hs20 * 3,
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSize.hs18),
                    bottomRight: Radius.circular(AppSize.hs18),
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.whiteHoly,
                  size: AppSize.hs14 * 2,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
