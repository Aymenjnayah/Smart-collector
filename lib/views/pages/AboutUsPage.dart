import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_collector/widgets/medium_text_widget.dart';
import '../../config/app_colors.dart';
import '../../config/values_manager.dart';
import '../../routes/app_routes.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
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
                    onPressed:() {
 Get.offNamed(AppRoutes.profile);                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30.0,
                      color: Color.fromARGB(255, 81, 78, 78),
                    ),
                  ),
                ),
                MediumTextWidget(
                  text: "About Us",
                  color: AppColor.Subtitle,
                  size: FontSize.fs18,
                ),
                SizedBox(width: 35, height: 35),
              ],
            ),
            SizedBox(height: AppSize.hs14),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/images/logo.png', width: 300),
                    ),
                    SizedBox(height: 20),
                    MediumTextWidget(
                      text: "lorem ipsum",
                      color: AppColor.Subtitle,
                      size: FontSize.fs18,
                    ),
                    SizedBox(height: 10),
                    MediumTextWidget(
                      text: "lorem ipsum",
                      color: AppColor.Subtitle,
                      size: FontSize.fs18,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.mail,
                            color: AppColor.primary_color,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: AppColor.primary_color,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: AppColor.primary_color,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
