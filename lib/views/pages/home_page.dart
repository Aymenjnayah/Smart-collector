import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/home_controller.dart';
import 'package:smart_collector/widgets/button_widget.dart';

import '../../config/app_colors.dart';
import '../../config/fonts_manager.dart';
import '../../config/values_manager.dart';
import '../../routes/app_routes.dart';
import '../../widgets/medium_text_widget.dart';
import '../../widgets/request_card.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              padding: EdgeInsets.symmetric(
                vertical: AppPadding.hp14,
                horizontal: AppPadding.wp10,
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
                        CircleAvatar(
                          backgroundColor: AppColor.primary_color,
                          radius: 25,
                          backgroundImage:
                          AssetImage("assets/images/aymen.jpg"),
                        ),
                        SizedBox(width: AppSize.ws10),
                        MediumTextWidget(
                          text: "Aymen Jnayah",
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
                              text: "78 Points",
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
                              text: "126 Litres",
                              size: FontSize.fs14,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),

            Obx(
                  () => Expanded(
                    child: ListView.builder(
                itemCount: controller.myList.length,
                itemBuilder: (context, index) {
                    return RequestCard(
                      liters: "${controller.myList[index].liters}L",
                      gift: controller.myList[index].gift.toString(),
                      date: controller.myList[index].date.toString(),
                    );
                },
              ),
                  ),
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           Get.offNamed(AppRoutes.NewRequest1);
          },
          child: Icon(Icons.add),
        )
    );
  }
}
