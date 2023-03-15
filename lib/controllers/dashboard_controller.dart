import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class DashboardController extends GetxController {
  final items = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    items.addAll(['Item 1', 'Item 2', 'Item 3']);
  }

  void addItem(String item) {
    items.add(item);
  }
}
