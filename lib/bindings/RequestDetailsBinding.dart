import 'package:get/get.dart';

import '../controllers/RequestDetails_controller.dart';

class RequestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestDetailsController());
  }
}