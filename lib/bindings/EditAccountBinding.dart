import 'package:get/get.dart';

import '../controllers/EditAccount_controller.dart';

class EditAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditAccountController());
  }
}