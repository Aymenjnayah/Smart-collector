import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class SignInController extends GetxController {
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
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      String uid = userCredential.user!.uid;
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      String role = userData?['role'] ?? '';
      if (role == 'admin') {
        Get.toNamed(AppRoutes.dashboard);
      } else {
        Get.snackbar('Error', 'You are not authorized to access this page');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided');
      } else {
        Get.snackbar('Error', 'An error occurred while signing in');
      }
    } catch (e) {
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
}
