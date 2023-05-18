import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_collector/config/base_controller.dart';
import '../routes/app_routes.dart';

class SignUpController extends GetxController with BaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!_isTunisianPhoneNumber(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  bool _isTunisianPhoneNumber(String value) {
    // Tunisian phone number format: +216xxxxxxxx or 216xxxxxxxx or 00216xxxxxxxx
    final RegExp regex = RegExp(r'^(\+?216|00216|216)?(5|9|7)([0-9]{7})$');
    return regex.hasMatch(value);
  }


  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? validateConfirmPassword(String? password,String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  void handleSignUp() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final nameError = validateName(name);
    if (nameError != null) {
      Get.snackbar('Error', nameError);
      return;
    }

    final emailError = validateEmail(email);
    if (emailError != null) {
      Get.snackbar('Error', emailError);
      return;
    }

    final phoneNumberError = validatePhoneNumber(phoneNumber);
    if (phoneNumberError != null) {
      Get.snackbar('Error', phoneNumberError);
      return;
    }

    final passwordError = validatePassword(password);
    if (passwordError != null) {
      Get.snackbar('Error', passwordError);
      return;
    }

    final confirmPasswordError = validateConfirmPassword(password,confirmPassword);
    if (confirmPasswordError != null) {
      Get.snackbar('Error', confirmPasswordError);
      return;
    }

    showLoading();

    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      await _db.collection('users').doc(user?.uid).set({
        'name': name,
        'email': email,
        'phone': phoneNumber,
      });
      hideLoading();
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
