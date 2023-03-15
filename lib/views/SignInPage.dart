import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/widgets/submit_button.dart';

import '../config/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';

class SignInPage extends StatelessWidget {
  static const registerRoute = '/register';
  static const dashboardRoute = '/dashboard';

  const SignInPage({Key? key}) : super(key: key);

  Widget buildSpacer() {
    return const SizedBox(
      height: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 32, color: AppColor.primary_color),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "log to your Account !",
                  style: TextStyle(fontSize: 18, color: AppColor.Subtitle),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does not have account?'),
                    TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
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
    );
  }
}
