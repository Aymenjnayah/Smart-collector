import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';

import '../../../config/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPageSteptwo extends StatelessWidget {
  const NewRequestPageSteptwo({Key? key}) : super(key: key);
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
                          child: IconButton(
                            onPressed: () {
                              Get.offNamed(AppRoutes.NewRequest1);
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 30.0,
                              color: Color.fromARGB(255, 81, 78, 78),
                            ),
                          ),
                        ),
                        MediumTextWidget(
                          text: "Make a new Request",
                          color: AppColor.Subtitle,
                          size: FontSize.fs18,
                        ),
                      ],
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
                          width: AppSize.ws20 * 1.5,
                          height: AppSize.hs14,
                          decoration: BoxDecoration(
                            color: AppColor.primary_color,
                            borderRadius:
                                BorderRadius.circular(AppPadding.hp20),
                          ),
                        ),
                        SizedBox(width: AppSize.ws5 / 2),
                        Container(
                          width: AppSize.ws10,
                          height: AppSize.hs14,
                          decoration: BoxDecoration(
                            color: AppColor.primary_color,
                            borderRadius:
                                BorderRadius.circular(AppPadding.hp20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
