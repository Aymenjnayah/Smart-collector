import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/NewRequestStepTwo_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import 'package:smart_collector/widgets/gift_item.dart';
import '../../../config/app_colors.dart';
import '../../../widgets/NewRequestAppBar.dart';

class NewRequestPageSteptwo extends StatelessWidget {
  NewRequestPageSteptwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewRequestStepTwoController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustumAppBar(
              title: "New Request",
            ),
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
                  width: AppSize.ws10 * 2,
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
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
