import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/app_colors.dart';
import 'package:smart_collector/controllers/ForgetPassword_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';

import '../../config/values_manager.dart';


class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppPadding.hp20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.fs20 ,
                  color: AppColors.primary_color,
                ),
              ),
              SizedBox(height: AppSize.hs20),
              Text(
                "Enter your valid email and check your email to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: FontSize.fs16,
                  color: AppColors.Subtitle,
                ),
              ),
              SizedBox(height: AppSize.hs20),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.hs20),
              SubmitButton(
                buttonText: "Submit",
                onPressed: () => controller.resetPassword(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
