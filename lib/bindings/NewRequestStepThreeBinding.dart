import 'package:get/get.dart';
import 'package:smart_collector/controllers/NewRequestStepThree_controller.dart';
import '../controllers/NewRequestStepTwo_controller.dart';

class NewRequestStepThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewRequestStepThreeController());
  }
}