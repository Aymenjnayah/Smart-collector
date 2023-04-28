import 'package:get/get.dart';
import 'package:smart_collector/controllers/NewRequestStepOne_controller.dart';

import '../controllers/NewRequestStepTwo_controller.dart';

class NewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewRequestStepOneController());
  }
}