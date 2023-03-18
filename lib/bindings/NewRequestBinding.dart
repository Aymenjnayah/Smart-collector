import 'package:get/get.dart';

import '../controllers/NewRequest_controller.dart';

class NewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewRequestController());
  }
}