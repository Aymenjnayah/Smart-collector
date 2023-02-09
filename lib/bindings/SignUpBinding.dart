import 'package:get/get.dart';
import 'package:smart_collector/controllers/signup_controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}