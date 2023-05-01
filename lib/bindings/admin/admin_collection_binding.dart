import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_collections_controller.dart';

class AdminCollectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminCollectionsController());
  }
}