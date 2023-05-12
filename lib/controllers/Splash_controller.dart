import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    loading();
  }

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 3));

    User? user = _auth.currentUser;
    if (user == null) {
      // User not logged in, navigate to onboarding screen
      Get.offNamed(AppRoutes.Onboarding);
    } else {
      // User logged in, check if isAdmin
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('users').doc(user.uid).get();
      String isAdmin = snapshot.data()?['role'] ?? "user";

      if (isAdmin=="admin") {
        // User is an admin, navigate to admin dashboard
        Get.offNamed(AppRoutes.adminDahboard);
      } else {
        // User is not an admin, navigate to user dashboard
        Get.offNamed(AppRoutes.dashboard);
      }
    }
  }
}
