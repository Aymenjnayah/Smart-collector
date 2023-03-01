import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/widgets/submit_button.dart';

import '../config/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                      fontSize: 32, color: AppColor.primary_color),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "log to your Account !",
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: AppColor.Subtitle),
                ),
                SizedBox(
                  height: 20,
                ),
                makeInput(hint: "Email", icon: Icon(Icons.email)),
                SizedBox(
                  height: 20.0,
                ),
                makeInput(
                  hint: "Password",
                  icon: Icon(Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Get.offNamed(AppRoutes.dashboard);
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.offNamed(AppRoutes.register);
                        })
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
