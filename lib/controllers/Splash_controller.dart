import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:async';
import 'package:smart_collector/routes/app_routes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 3), () {
   
      Get.offNamed(AppRoutes.Onboarding);
    });
  }

}