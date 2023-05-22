import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../models/Request.dart';
import '../models/RequestModel.dart';
import '../models/user.dart';

class HomeController extends GetxController with BaseController {
  final myList = <Request>[].obs;
  Rx<UserModel> currentUser = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCurrentUser();
    fetchRequests();
  }

  Future<void> fetchCurrentUser() async {
    try {
      String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel user = UserModel.fromDocument(userDoc);
      currentUser.value = user;
    } catch (e) {
      // Handle any errors
    }
  }

  Future<void> fetchRequests() async {
    showLoading();
    try {
      String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      QuerySnapshot requestDocs = await FirebaseFirestore.instance
          .collection('requests')
          .where('userUID', isEqualTo: uid)
          .get();
      myList.value = requestDocs.docs.map<Request>((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['docId'] = doc.id; // Add the document ID to the data
        return Request.fromMap(data);
      }).toList();
      hideLoading();
    } catch (e) {
      hideLoading();
// Handle any errors
    }
  }

  void addItem() {}

  Future<void> deleteRequest(String? docId) async {
    try {
      if (docId == null) return;
      showLoading();
      await FirebaseFirestore.instance.collection('requests').doc(docId).delete();
      myList.removeWhere((request) => request.docId == docId);
      hideLoading();

    } catch (e) {
      hideLoading();
      // Handle any errors
    }
  }

  void showQrCode(String? qrCode) {
    final dialog = Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrImageView(
                data: qrCode ?? '',
                size: 280,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(100, 100),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

