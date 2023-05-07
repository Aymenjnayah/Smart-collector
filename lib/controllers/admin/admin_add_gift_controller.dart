import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_collector/config/base_controller.dart';
import 'package:uuid/uuid.dart';

import '../../models/Gift.dart';

class AdminAddGiftController extends GetxController with BaseController {
  var giftTitleController = TextEditingController();
  var giftImageController = TextEditingController();
  var giftPriceController = TextEditingController();
  var giftQuantityController = TextEditingController();

  Future<void> pickImage() async {
    showLoading();
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final storageRef = FirebaseStorage.instance.ref().child('gift_images/${Uuid().v4()}');
      final uploadTask = storageRef.putFile(file);
      await uploadTask.whenComplete(() {});
      final imageUrl = await storageRef.getDownloadURL();
      giftImageController.text = imageUrl;
      hideLoading();
    }
  }

  void addGift() {
    if (giftTitleController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a gift title',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (giftImageController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please select a gift image',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (giftPriceController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a gift price',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final double price = double.tryParse(giftPriceController.text.trim()) ?? -1;
    if (price <= 0) {
      Get.snackbar('Error', 'Please enter a valid gift price',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (giftQuantityController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a gift quantity',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final int quantity = int.tryParse(giftQuantityController.text.trim()) ?? -1;
    if (quantity <= 0) {
      Get.snackbar('Error', 'Please enter a valid gift quantity',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    showLoading();
    // All fields are valid, so add the gift to the database
    final gift = Gift(
      title: giftTitleController.text.trim(),
      imageUrl: giftImageController.text.trim(),
      price: price,
      quantity: quantity,
    );
    FirebaseFirestore.instance.collection('gifts').add(gift.toMap()).then((value) {
      hideLoading();
      Get.snackbar('Success', 'Gift added successfully',
          snackPosition: SnackPosition.BOTTOM);
      // Clear the text controllers after the gift is added
      giftTitleController.clear();
      giftImageController.clear();
      giftPriceController.clear();
      giftQuantityController.clear();

    }).catchError((error) {
      hideLoading();
      Get.snackbar('Error', 'Failed to add gift: $error',
          snackPosition: SnackPosition.BOTTOM);
    });
  }


}

