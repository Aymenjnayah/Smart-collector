import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdminScannerController extends GetxController {
  void goToNext() {
    // Implement your logic to navigate to the next screen here
  }

  void onQRCodeScanned(String data) {
    // Handle the scanned QR code data
    goToNext();
  }

  void goToNextScreen(String? qrCodeData) {
    print("goToNextScreen");
    print(qrCodeData);
  }
}

