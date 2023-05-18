import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/app_colors.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/controllers/signup_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';

import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: AppSize.hs100,
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.fs24,
                        color: AppColors.primary_color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppSize.hs10,
                    ),
                    const Text(
                      "and join the community",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: AppColors.Subtitle,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.hs10,
                    ),
                    makeInput(
                        hint: "Name",
                        icon: const Icon(Icons.person),
                        controller: controller.nameController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    makeInput(
                        hint: "Email",
                        icon: const Icon(Icons.email),
                        controller: controller.emailController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    makeInput(
                        hint: "Phone number",
                        icon: Icon(Icons.phone),
                        controller: controller.phoneNumberController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    makeInput(
                        hint: "Password",
                        icon: const Icon(Icons.lock),
                        obscureText: true,
                        controller: controller.passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    makeInput(
                        hint: "Confirm Password",
                        icon: const Icon(Icons.lock),
                        obscureText: true,
                        controller: controller.confirmPasswordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SubmitButton(
                        buttonText: "Sign up",
                        onPressed: () => {controller.handleSignUp()}),
                    Row(
                      // ignore: sort_child_properties_last
                      children: <Widget>[
                        const Text('I have an account!',style: TextStyle(fontWeight: FontWeight.bold),),
                        TextButton(
                            child: const Text(
                              'Sign in',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Get.offNamed(AppRoutes.login);
                            })
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
