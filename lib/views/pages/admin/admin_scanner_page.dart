import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_scanner_controller.dart';

import '../../../widgets/NewRequestAppBar.dart';

class AdminScannerPage extends StatelessWidget {
  const AdminScannerPage({Key? key}) : super(key: key);

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
                onTap: () {controller.goToNext();},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/qr_code_image.png",
                      width: 180,
                      height: 180,
                    ),
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
