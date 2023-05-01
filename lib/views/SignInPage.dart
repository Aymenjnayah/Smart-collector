import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/singin_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';

import '../config/app_colors.dart';
import '../widgets/custum_text_field.dart';

class SignInPage extends GetView<SignInController> {
  static const registerRoute = '/register';
  static const dashboardRoute = '/dashboard';

  const SignInPage({Key? key}) : super(key: key);

  Widget buildSpacer() {
    return SizedBox(
      height: AppSize.hs20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: AppPadding.hp20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.fs20 * 2,
                        color: AppColors.primary_color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppSize.hs10,
                    ),
                    const Text(
                      "Log to your Account !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: AppColors.Subtitle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.hs10,
                ),
                Column(
                  children: [
                    makeInput(hint: "Email", icon: const Icon(Icons.email)),
                    buildSpacer(),
                    makeInput(
                      hint: "Password",
                      icon: const Icon(Icons.lock),
                    ),
                    buildSpacer(),
                    SubmitButton(
                      buttonText: "Sign in",
                      onPressed: () => {controller.goToDashboard()},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does not have account?'),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: FontSize.fs20),
                      ),
                      onPressed: () => {controller.goToRegister()},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
