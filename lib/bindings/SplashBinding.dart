import 'package:get/get.dart';

import '../controllers/Splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
    SplashController(),
    );
  }
}