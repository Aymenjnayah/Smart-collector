import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/NewRequestStepOne_controller.dart';
import 'package:smart_collector/widgets/AmountInput.dart';
import 'package:smart_collector/widgets/NewRequestAppBar.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import '../../../config/app_colors.dart';
import '../../../widgets/custum_text_field.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPageStepOne extends StatelessWidget {
  final controller = NewRequestStepOneController();
  NewRequestPageStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: "New Request",
            ),
            SizedBox(height: AppSize.hs14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MediumTextWidget(
                text: "Set amount, appointment and address",
                color: AppColors.gold,
                size: FontSize.fs18,
              ),
            ),
            SizedBox(height: AppSize.hs14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppSize.ws25,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
                SizedBox(width: AppSize.ws5 / 2),
                Container(
                  width: AppSize.ws10,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
              ],
            ),
            Obx(() => AmountInput(
              value: controller.amount.value.toString(),
              onLeftGesture: () {
                controller.increaseAmount();
              },
              onRightGesture: () {
                controller.decreaseAmount();
              },
            )),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColors.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MediumTextWidget(
                text: "Address",
                color: AppColors.Subtitle,
                size: FontSize.fs18,
              ),
            ),
            SizedBox(height: AppSize.hs10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: AppColors.grey,
                    size: AppSize.hs20 * 2,
                  ),
                  SizedBox(width: AppSize.ws10),
                  Obx(() =>  MediumTextWidget(
                    text: controller.address.value,
                    color: AppColors.Subtitle,
                    size: FontSize.fs16,
                  )),
                ],
              ),
            ),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColors.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            GestureDetector(
              onTap: ()=>{
                controller.addAddress()
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.primary_color,
                        size: AppSize.hs20 * 2,
                      ),
                      SizedBox(width: AppSize.ws10),
                      MediumTextWidget(
                        text: "Change Address",
                        color: AppColors.primary_color,
                        size: FontSize.fs18,
                      ),
                    ],
                  )),
            ),
            SizedBox(height: AppSize.hs14),
            Container(
              width: double.maxFinite,
              height: AppSize.hs5 / 2,
              color: AppColors.primary_white_color,
            ),
            SizedBox(height: AppSize.hs14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MediumTextWidget(
                text: "Appointment",
                color: AppColors.Subtitle,
                size: FontSize.fs18,
              ),
            ),
            SizedBox(height: AppSize.hs10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () => {controller.getDate()},
                child: makeInput(
                    clickable: true,
                    hint: "Select Date",
                    controller: controller.dateController,
                    icon: const Icon(Icons.calendar_month)),
              ),
            ),
            SizedBox(height: AppSize.hs20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SubmitButton(buttonText: "Next step", onPressed: () => {
                controller.goToNextStep()
              }),
            )
          ],
        ),
      )),
    );
  }
}

