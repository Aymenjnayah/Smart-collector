import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/home_controller.dart';
import 'package:smart_collector/widgets/button_widget.dart';

import '../../config/app_colors.dart';
import '../../config/fonts_manager.dart';
import '../../config/values_manager.dart';
import '../../widgets/medium_text_widget.dart';
import '../../widgets/request_card.dart';

class HomePage extends StatelessWidget {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    print(controller.data.length);

    return SafeArea(
      child: Scaffold(
          //body
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
          child: Column(children: [
            SizedBox(height: AppSize.hs20),
            // head container
            Container(
              width: double.maxFinite,
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
                          text: "Sidi ahmed habib",
                          size: FontSize.fs20,
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
                              Icons.circle,
                              size: AppSize.hs25,
                              color: AppColor.primary_color,
                            ),
                            SizedBox(width: AppSize.ws5),
                            MediumTextWidget(
                              text: "15 Pts",
                              size: FontSize.fs18,
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
                              text: "15 Liters",
                              size: FontSize.fs18,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: AppSize.hs25),
            // add request
            controller.data.length == 0
                ? Column(
                    children: [
                      SizedBox(
                        width: Get.width / 1.5,
                        child: Image.asset("assets/images/home_background.png"),
                      ),
                      SizedBox(height: AppSize.hs25),
                      MediumTextWidget(
                        text: "Get rid of cooking oil",
                        size: FontSize.fs22,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                      MediumTextWidget(
                        text: "with the smart collector",
                        size: FontSize.fs22,
                        fontWeight: FontWeightManager.semiBold,
                      ),
                      SizedBox(height: AppSize.hs10),
                      MediumTextWidget(
                        text: "make a resquest and we will come",
                        size: FontSize.fs16,
                        fontWeight: FontWeightManager.regular,
                        color: AppColor.grey,
                      ),
                      MediumTextWidget(
                        text: "to your home with a gift",
                        size: FontSize.fs16,
                        fontWeight: FontWeightManager.regular,
                        color: AppColor.grey,
                      ),
                      SizedBox(height: AppSize.hs25),
                      ButtonWidget(
                        text: "Add New Request",
                        color: AppColor.primary_color,
                      )
                    ],
                  )
                : Column(
                    children: [
                      //row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumTextWidget(
                            text: "Your Request",
                            size: FontSize.fs20,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColor.primary_color,
                            size: AppSize.hs20 * 2,
                          )
                        ],
                      ),
                      SizedBox(height: AppSize.hs25),
                      //list
                      Container(
                        height: double.maxFinite,
                        child: Expanded(
                          child: ListView.separated(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return RequestCard(
                                liters: "${controller.data[index].liters}L",
                                gift: controller.data[index].gift.toString(),
                                date: controller.data[index].date.toString(),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: AppSize.hs20,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
          ]),
        ),
      )),
    );
  }
}
