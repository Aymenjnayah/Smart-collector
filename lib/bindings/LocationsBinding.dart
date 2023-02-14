import 'package:get/get.dart';

import '../controllers/Locations_controller.dart';

class LocationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationsController());
  }
}