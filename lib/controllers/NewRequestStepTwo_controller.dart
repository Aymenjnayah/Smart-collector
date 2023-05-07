import 'package:get/get.dart';
import '../models/Gift.dart';
import '../models/Item.dart';
import '../routes/app_routes.dart';

class NewRequestStepTwoController extends GetxController {
  final items = <Gift>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("NewRequestStepTwoController");
    // Sample data
    items.addAll([

    ]);
  }

  goToLastStep() {
    Get.toNamed(AppRoutes.NewRequest3);
  }
}

