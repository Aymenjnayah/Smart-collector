import 'package:get/get.dart';
import '../models/Request.dart';

class NewRequestStepThreeController extends GetxController {
  final request = Request().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    request.value = Get.arguments as Request;

  }
}

