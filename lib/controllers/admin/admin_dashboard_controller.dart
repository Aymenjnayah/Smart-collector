import 'package:get/get.dart';
import 'package:smart_collector/routes/app_routes.dart';

class AdminDashboardController extends GetxController {
  void goToNextScreen(int index) {
    switch(index) {
      case 0:
        Get.toNamed(AppRoutes.adminCollections);
        break;
      case 1:
        Get.toNamed(AppRoutes.users);
        break;
      case 2:
        Get.toNamed(AppRoutes.adminRequests);
        break;
      default:
        Get.toNamed(AppRoutes.adminScanner);
        break;
    }
  }


}