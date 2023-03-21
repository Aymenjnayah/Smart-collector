import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/widgets/submit_button.dart';

import '../config/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';

class SignInPage extends StatelessWidget {
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
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(AppPadding.hp20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: FontSize.fs16 * 2,
                        color: AppColor.primary_color),
                  ),
                  SizedBox(
                    height: AppSize.hs10,
                  ),
                  const Text(
                    "log to your Account !",
                    style: TextStyle(fontSize: 18, color: AppColor.Subtitle),
                  ),
                  SizedBox(
                    height: AppSize.hs20,
                  ),
                  makeInput(hint: "Email", icon: const Icon(Icons.email)),
                  buildSpacer(),
                  makeInput(
                    hint: "Password",
                    icon: const Icon(Icons.lock),
                  ),
                  buildSpacer(),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Get.offNamed(dashboardRoute);
                    },
                    child: const Text(
                      'Sign in',
                    ),
                  ),
                  SizedBox(
                    height: AppSize.hs20 * 2,
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
                          onPressed: () {
                            Get.offNamed(registerRoute);
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
