import 'package:get/get.dart';

import '../controllers/NewRequestStepTwo_controller.dart';

class NewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewRequestController());
  }
}