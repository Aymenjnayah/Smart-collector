import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_scanner_controller.dart';
import '../../../widgets/NewRequestAppBar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AdminScannerPage extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  AdminScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminScannerController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustumAppBar(
              title: "QR Scanner",
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      controller.scannedDataStream.listen((scanData) {
                        // Call the method in the controller to handle the scanned QR code data
                        controller.pauseCamera();
                        controller.dispose();
                        controller.resumeCamera();

                        // Pass the scanned QR code data to the controller
                        final qrCodeData = scanData.code;
                        final adminScannerController = Get.find<AdminScannerController>();
                        adminScannerController.goToNextScreen(qrCodeData);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
