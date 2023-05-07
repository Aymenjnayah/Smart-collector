import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../../models/Gift.dart';
import '../../routes/app_routes.dart';


class AdminCollectionsController extends GetxController with BaseController {
  final items = <Gift>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getGifts();
  }


  Future<void> _getGifts() async {
    try {
      showLoading();
      final snapshot = await FirebaseFirestore.instance.collection('gifts').get();
      final gifts = snapshot.docs.map((doc) => Gift.fromMap(doc.data())).toList();
      items.addAll(gifts);
      hideLoading();
    } catch (error) {
      hideLoading();
      debugPrint(error.toString());
      // Show error message to user
      Get.snackbar(
        'Error',
        'Failed to get gifts from server',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  goToAddGift() {
    Get.toNamed(AppRoutes.adminAddGift);
  }
}
