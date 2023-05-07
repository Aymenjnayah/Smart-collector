import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_add_gift_controller.dart';
import 'package:smart_collector/controllers/admin/admin_collections_controller.dart';

class AdminAddGiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminAddGiftController());
  }
}