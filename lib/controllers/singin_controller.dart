import 'package:get/get.dart';
import 'package:smart_collector/routes/app_routes.dart';

class SignInController extends GetxController {
  goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  goToDashboard(){
    Get.toNamed(AppRoutes.dashboard);
  }
}
