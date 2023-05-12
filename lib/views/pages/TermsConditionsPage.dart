import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/values_manager.dart';
import '../../routes/app_routes.dart';
import '../../widgets/medium_text_widget.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // App Bar
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
                        Get.offNamed(AppRoutes.profile);
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30.0,
                        color: Color.fromARGB(255, 81, 78, 78),
                      ),
                    ),
                  ),
                  MediumTextWidget(
                    text: "Terms & Conditions",
                    color: AppColors.Subtitle,
                    size: FontSize.fs18,
                  ),
                  SizedBox(width: 35, height: 35),
                ],
              ),
              SizedBox(height: AppSize.hs14),
              // Title and Description
              TermsConditionsSectionWidget(
                title: 'Terms and Conditions',
                description:
                'These terms and conditions govern your use of the Smart Collector app. By using this app, you accept these terms and conditions in full. If you disagree with these terms and conditions or any part of these terms and conditions, you must not use this app.',
              ),
              SizedBox(height: 16.0),
              // Section 1
              TermsConditionsSectionWidget(
                title: 'Section 1 - Use of the App',
                description:
                'You must be at least 18 years of age to use this app. By using this app, you warrant and represent that you are at least 18 years of age.',
              ),
              SizedBox(height: 16.0),
              // Section 2
              TermsConditionsSectionWidget(
                title: 'Section 2 - User Accounts',
                description:
                'To use certain features of the app, you may need to create a user account. You are responsible for maintaining the confidentiality of your account and password and for restricting access to your account. You agree to accept responsibility for all activities that occur under your account or password. You must notify us immediately if you become aware of any unauthorized use of your account or password or any other breach of security.',
              ),
              SizedBox(height: 16.0),
              // Section 3
              TermsConditionsSectionWidget(
                title: 'Section 3 - User Content',
                description:
                'You grant us a non-exclusive, royalty-free, transferable, sub-licensable, worldwide license to use, store, display, reproduce...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsConditionsSectionWidget extends StatelessWidget {
  final String title;
  final String description;

  const TermsConditionsSectionWidget({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
