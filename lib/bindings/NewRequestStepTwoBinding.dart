import 'package:get/get.dart';
import '../controllers/NewRequestStepTwo_controller.dart';

class NewRequestStepTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewRequestStepTwoController());
  }
}