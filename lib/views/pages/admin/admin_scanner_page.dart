import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_scanner_controller.dart';
import '../../../widgets/NewRequestAppBar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class AdminScannerPage extends StatefulWidget {
  @override
  _QRCodeReaderPageState createState() => _QRCodeReaderPageState();
}

class _QRCodeReaderPageState extends State<AdminScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (isScanning) return; // Prevent multiple scans
      isScanning = true;
      print('Scanned QR Code: ${scanData.code}');
      // Perform any necessary actions with the scanned data here
      final qrCodeData = scanData.code;

      final requestsCollection = FirebaseFirestore.instance.collection('requests');
      final querySnapshot = await requestsCollection.doc(qrCodeData).get();

      if (querySnapshot.exists) {
        final requestDoc = querySnapshot;
        final requestId = requestDoc.id;

        // Update the status of the request to true
        await requestsCollection.doc(requestId).update({'status': true});

        // Show a dialog indicating the status change
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Statut Modifié'),
              content: Text('Le statut de la demande a été modifié avec succès.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }

      // Delay for 2 seconds to prevent multiple scans
      await Future.delayed(Duration(seconds: 2));
      isScanning = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }
}
