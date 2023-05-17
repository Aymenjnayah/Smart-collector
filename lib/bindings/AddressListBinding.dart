import 'package:get/get.dart';
import 'package:smart_collector/controllers/AddressListController.dart';

class AddressListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressListController());
  }
}