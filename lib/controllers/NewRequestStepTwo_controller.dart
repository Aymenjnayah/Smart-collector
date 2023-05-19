import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_collector/config/base_controller.dart';
import '../models/Gift.dart';
import '../models/Request.dart';
import '../routes/app_routes.dart';

class NewRequestStepTwoController extends GetxController with BaseController {
  final items = <Gift>[].obs;
  final request = Request().obs;

  @override
  void onInit() {
    super.onInit();
    fetchGifts();
    request.value = Get.arguments as Request;
  }

  void fetchGifts() async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('gifts').get();
      if (snapshot.docs.isNotEmpty) {
        final List<Gift> gifts = snapshot.docs.map((doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          data['uid'] = doc.id; // Add the UID to the data map
          return Gift.fromJson(data);
        }).toList();

        items.addAll(gifts);
      }
    } catch (e) {
      // Handle the error
    }
  }

  void increaseGiftCount(Gift gift) {
    final index = items.indexOf(gift);
    if (index != -1) {
      final currentCount = gift.selectedCount ?? 0;
      final updatedCount = currentCount + 1;
      final totalPrice = updatedCount * gift.price;

      if (totalPrice > request.value.amount!) {
        // Display error snackbar
        Get.snackbar(
          'Error',
          'Total price exceeds the requested amount.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      final updatedGift = gift.copyWith(selectedCount: updatedCount);
      items[index] = updatedGift;
    }
  }

  void decreaseGiftCount(Gift gift) {
    final index = items.indexOf(gift);
    if (index != -1) {
      final count = gift.selectedCount ?? 0;
      if (count > 1) {
        final updatedGift = gift.copyWith(selectedCount: count - 1);
        items[index] = updatedGift;
      } else {
        final updatedGift = gift.copyWith(selectedCount: null);
        items[index] = updatedGift;
      }
    }
  }


  void goToLastStep() async {
    final selectedGifts = items
        .where((gift) => gift.selectedCount != null && gift.selectedCount! > 0)
        .map((gift) => {
      'id': gift.id, // Assuming the ID field name is 'id'
      'selectedCount': gift.selectedCount,
    })
        .toList();
    if (selectedGifts.isEmpty) {
      Get.snackbar(
        'Erreur',
        'Veuillez sélectionner au moins un cadeau.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    showLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final userUID = currentUser?.uid;
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final qrData = '$userUID-$timestamp';
    final qrCode = generateQRCode(qrData);
    final updatedRequest = Request(
      amount: request.value.amount,
      address: request.value.address,
      date: request.value.date,
      gifts: selectedGifts,
      userUID: userUID,
      qrCode: qrData
    );

    try {
      await FirebaseFirestore.instance.collection('requests').add(updatedRequest.toMap());
      hideLoading();
      Get.offAndToNamed(AppRoutes.NewRequest3, arguments: updatedRequest);
    } catch (e) {
      hideLoading();
      print('Error adding request to Firestore: $e');
    }
  }

  String generateQRCode(String qrData) {
     final qrCode = QrImageView(
      data: 'QR code',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
    return qrCode.toString();
  }


}
