import 'package:flutter/material.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/NewRequestStepOne_controller.dart';
import 'package:smart_collector/widgets/AmountInput.dart';
import 'package:smart_collector/widgets/NewRequestAppBar.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import '../../../config/app_colors.dart';
import '../../../widgets/custum_text_field.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPageStepOne extends StatelessWidget {
  const NewRequestPageStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = NewRequestStepOneController();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewRequestAppBar(
              title: "New Request",
            ),
            SizedBox(height: AppSize.hs14),
            MediumTextWidget(
              text: "Set amount, appointment and address",
              color: AppColor.gold,
              size: FontSize.fs14,
            ),
            SizedBox(height: AppSize.hs14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppSize.ws10 * 1.5,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColor.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
                SizedBox(width: AppSize.ws5 / 2),
                Container(
                  width: AppSize.ws10,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColor.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
              ],
            ),
            AmountInput(value: "5"),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColor.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            MediumTextWidget(
              text: "Address",
              color: AppColor.Subtitle,
              size: FontSize.fs18,
            ),
            SizedBox(height: AppSize.hs10),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppColor.grey,
                  size: AppSize.hs20 * 2,
                ),
                SizedBox(width: AppSize.ws10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumTextWidget(
                      text: "39 Ali belhawen street",
                      color: AppColor.Subtitle,
                      size: FontSize.fs16,
                    ),
                    MediumTextWidget(
                      text: "Eljem , Mahdia",
                      color: AppColor.Subtitle,
                      size: FontSize.fs16,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColor.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: AppColor.primary_color,
                      size: AppSize.hs20 * 2,
                    ),
                    SizedBox(width: AppSize.ws10),
                    MediumTextWidget(
                      text: "Change Address",
                      color: AppColor.primary_color,
                      size: FontSize.fs18,
                    ),
                  ],
                )),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColor.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            MediumTextWidget(
              text: "Appointment",
              color: AppColor.Subtitle,
              size: FontSize.fs18,
            ),
            SizedBox(height: AppSize.hs10),
            GestureDetector(
              onTap: () => {controller.getDate()},
              child: makeInput(
                  clickable: true,
                  hint: "Select Date",
                  controller: controller.dateController,
                  icon: const Icon(Icons.calendar_month)),
            ),
            SizedBox(height: AppSize.hs20),
            SubmitButton(buttonText: "Next step", onPressed: () => {})
          ],
        ),
      )),
    );
  }
}

