import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';

import '../../../config/app_colors.dart';
import '../../../widgets/custum_text_field.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPageStepOne extends StatelessWidget {
  const NewRequestPageStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.wp20, vertical: AppSize.hs20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.chevron_left,
                          size: 30.0,
                          color: Color.fromARGB(255, 81, 78, 78),
                        ),
                      ),
                      MediumTextWidget(
                        text: "Our weekly newsletter",
                        color: AppColor.Subtitle,
                        size: FontSize.fs18,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.hs14),
                  MediumTextWidget(
                    text: "Set amount, appointment and address",
                    color: AppColor.gold,
                    size: FontSize.fs18,
                  ),
                  SizedBox(height: AppSize.hs14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppSize.ws20 * 1.5,
                        height: AppSize.hs14,
                        decoration: BoxDecoration(
                          color: AppColor.primary_color,
                          borderRadius: BorderRadius.circular(AppPadding.hp20),
                        ),
                      ),
                      SizedBox(width: AppSize.ws5 / 2),
                      Container(
                        width: AppSize.ws10,
                        height: AppSize.hs14,
                        decoration: BoxDecoration(
                          color: AppColor.primary_color,
                          borderRadius: BorderRadius.circular(AppPadding.hp20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Amount button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumTextWidget(
                    text: "Amount (L)",
                    color: AppColor.Subtitle,
                    size: FontSize.fs18,
                  ),
                  SizedBox(height: AppSize.hs10),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                        height: AppSize.hs20 * 3,
                        decoration: BoxDecoration(
                          color: AppColor.primary_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.hs18),
                            bottomLeft: Radius.circular(AppSize.hs18),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColor.whiteHoly,
                          size: AppSize.hs14 * 2,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                          height: AppSize.hs20 * 3,
                          color: AppColor.greyOne,
                          child: Center(
                            child: MediumTextWidget(
                              text: "5.00",
                              color: AppColor.Subtitle,
                              size: FontSize.fs18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.wp16),
                        height: AppSize.hs20 * 3,
                        decoration: BoxDecoration(
                          color: AppColor.gold,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppSize.hs18),
                            bottomRight: Radius.circular(AppSize.hs18),
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: AppColor.whiteHoly,
                          size: AppSize.hs14 * 2,
                        ),
                      )
                    ],
                  )
                ],
              ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  )
                ],
              ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumTextWidget(
                    text: "Appointment",
                    color: AppColor.Subtitle,
                    size: FontSize.fs18,
                  ),
                  SizedBox(height: AppSize.hs10),
                  makeInput(
                      hint: "Select Date",
                      icon: const Icon(Icons.calendar_month)),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
