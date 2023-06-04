import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/NewRequestStepTwo_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import 'package:smart_collector/widgets/gift_item.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_styles.dart';
import '../../../widgets/NewRequestAppBar.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPageSteptwo extends StatelessWidget {
  final controller = Get.put(NewRequestStepTwoController());
  NewRequestPageSteptwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: "New Request",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MediumTextWidget(
                      text: "Choose your Gift !",
                      color: AppColors.gold,
                      size: FontSize.fs18,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/money_icon.png"),
                      ),
                      SizedBox(width: 5),
                      Obx(() => Text(
                        "${controller.request.value.amount} Pts balance",
                        style: AppStyles.black14W5Style,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.hs14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppSize.ws10,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
                SizedBox(width: AppSize.ws5 / 2),
                Container(
                  width: AppSize.ws25,
                  height: AppSize.ws10,
                  decoration: BoxDecoration(
                    color: AppColors.primary_color,
                    borderRadius: BorderRadius.circular(AppPadding.hp20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return GiftItem(
                      item: item,
                      showNumberPicker: true,
                      onDecrease: (value) {
                        controller.decreaseGiftCount(item); // Decrease the selected count for the gift
                      },
                      onIncrease: (value) {
                        controller.increaseGiftCount(item); // Increase the selected count for the gift
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: SubmitButton(
                  buttonText: "Validate",
                  onPressed: () => {controller.goToLastStep()}),
            )
          ],
        ),
      ),
    );
  }
}
