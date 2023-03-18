import 'package:get/get.dart';

import '../controllers/EnterPassword_controller.dart';

class EnterPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterPasswordController());
  }
}