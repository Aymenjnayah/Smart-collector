import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:smart_collector/config/base_controller.dart';
import 'package:smart_collector/routes/app_routes.dart';

class ForgetPasswordController extends GetxController with BaseController {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() async {
    String email = emailController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return;
    }
    showLoading();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      hideLoading();
      Get.snackbar('Success', 'Password reset email sent. Please check your email.');
    } catch (error) {
      hideLoading();
      Get.snackbar('Error', 'An error occurred. Please try again later.');
      print('Password reset error: $error');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
