import 'dart:async';
import 'package:smart_collector/routes/app_routes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    print("hello world");
    loading();
  }
  @override
  void onReady() {
    super.onReady();

  }

  Future<void> loading() async {
    Timer(Duration(seconds: 3), () {
   
      Get.offNamed(AppRoutes.Onboarding);
    });
  }

}