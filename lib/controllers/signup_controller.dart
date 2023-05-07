import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_collector/config/base_controller.dart';
import '../routes/app_routes.dart';

class SignUpController extends GetxController with BaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // controller fields for the signup form
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  // validation function for email input
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  // validation function for password input
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || !value.isPhoneNumber) {
      return 'Phone number is required should be valid';
    }
    return null;
  }

  // validation function for confirm password input
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // function to handle signup button press
  void handleSignUp() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = phoneNumberController.text;

    // perform form validation
    if (!GetUtils.isLengthGreaterThan(name, 0)) {
      Get.snackbar('Error', 'Name is required');
      return;
    }
    final emailError = validateEmail(email);
    if (emailError != null) {
      Get.snackbar('Error', emailError);
      return;
    }
    final passwordError = validatePhoneNumber(password);
    if (passwordError != null) {
      Get.snackbar('Error', passwordError);
      return;
    }
    final confirmPasswordError = validatePassword(passwordController.text);
    if (confirmPasswordError != null) {
      Get.snackbar('Error', confirmPasswordError);
      return;
    }
    showLoading();
    // create user with email and password
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      // add user data to firestore
      await _db.collection('users').doc(user?.uid).set({
        'name': name,
        'email': email,
        'phone':phoneNumberController.text
      });
      hideLoading();
      // navigate to dashboard route
      Get.offNamed(AppRoutes.dashboard);
    } on FirebaseAuthException catch (e) {
      print(e);
      hideLoading();
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email');
      } else {
        Get.snackbar('Error', 'An error occurred while signing up. Please try again later');
      }
    } catch (e) {
      hideLoading();
      Get.snackbar('Error', 'An error occurred while signing up. Please try again later');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
