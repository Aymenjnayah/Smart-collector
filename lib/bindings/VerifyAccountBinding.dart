import 'package:get/get.dart';

import '../controllers/VerifyAccount_controller.dart';

class VerifyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyAccountController());
  }
}