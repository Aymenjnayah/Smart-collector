import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }
}