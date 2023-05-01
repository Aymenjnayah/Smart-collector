import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_requests_controller.dart';
import 'package:smart_collector/controllers/admin/users_controller.dart';

class AdminRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminRequestsController());
  }
}