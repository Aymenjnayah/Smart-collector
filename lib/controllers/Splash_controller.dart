import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    loading();
  }

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(AppRoutes.Onboarding);
  }
}
