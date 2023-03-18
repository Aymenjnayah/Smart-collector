import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:smart_collector/routes/app_routes.dart';

class EditAccountController extends GetxController {

  forwardAction() {
    Get.offNamed(AppRoutes.EditAccount);
  }
}

