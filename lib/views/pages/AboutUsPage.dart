import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/AboutUsController.dart';
import 'package:smart_collector/widgets/medium_text_widget.dart';
import '../../config/app_colors.dart';
import '../../config/values_manager.dart';
import '../../routes/app_routes.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AboutUsController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30.0,
                    color: Color.fromARGB(255, 81, 78, 78),
                  ),
                ),
                Spacer(),
                MediumTextWidget(
                  text: "About Us",
                  color: AppColors.Subtitle,
                  size: FontSize.fs24,
                ),
                Spacer(),
                SizedBox(width: 30, height: 30),
              ],
            ),
            SizedBox(height: AppSize.hs14),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "The App is a revolutionary solution to save the earth and encourage people to change their habits. With numerous benefits and the opportunity to earn points for every sustainable change, our app motivates users to take actions that positively impact the environment.",
                        style: TextStyle(
                          color: AppColors.Subtitle,
                          fontSize: FontSize.fs18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Join us in making a difference and building a greener future!",
                        style: TextStyle(
                          color: AppColors.Subtitle,
                          fontSize: FontSize.fs18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.mail,
                            color: AppColors.primary_color,
                          ),
                          onPressed: () {
                            controller.goToSendEmail();
                          },
                        ),
                        SizedBox(width: 30),
                        IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: AppColors.primary_color,
                          ),
                          onPressed: () {
                            controller.goToPhoneCall();

                          },
                        ),
                        SizedBox(width: 30),
                        IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: AppColors.primary_color,
                          ),
                          onPressed: () {
                            controller.goToMaPosition();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
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
