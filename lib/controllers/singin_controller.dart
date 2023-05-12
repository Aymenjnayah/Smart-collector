import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';
import '../routes/app_routes.dart';

class SignInController extends GetxController with BaseController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  bool get isFormValid => isEmailValid.value && isPasswordValid.value;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  Future<void> handleSignIn() async {
    showLoading();
    try {


      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.toString(), password: passwordController.text.toString());
      String uid = userCredential.user!.uid;
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      String role = userData?['role'] ?? '';
      print("role");
      hideLoading();
      if (role == 'admin') {
        Get.offAllNamed(AppRoutes.adminDahboard);
      } else {
        Get.offAllNamed(AppRoutes.dashboard);
      }
    } on FirebaseAuthException catch (e) {
      hideLoading();

      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided');
      } else {
        Get.snackbar('Error', 'An error occurred while signing in');
      }
    } catch (e) {
      hideLoading();
      Get.snackbar('Error', 'An error occurred while signing in');
    }
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  goToForgotPassword() {
    Get.toNamed(AppRoutes.ForgetPassword);
  }
}
