import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../models/Gift.dart';
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
    final currentUser = FirebaseAuth.instance.currentUser;
    final userUID = currentUser?.uid;
    final requests = await FirebaseFirestore.instance.collection('requests').where('userUID', isEqualTo: userUID).get();
    final requestList = requests.docs.map((doc) async {
      final request = Request.fromMap(doc.data());

      final List<Map<String, dynamic>> gifts = request.gifts;
      final giftIds = gifts.map((giftData) => giftData['id']).toList();
      final giftObjects = await getGiftObjects(giftIds);
      request.giftObjects = giftObjects;
      return request;
    }).toList();

    myList.assignAll(await Future.wait(requestList));
    hideLoading();
  }


  Future<List<Gift>> getGiftObjects(List<dynamic> giftIds) async {
    final giftObjects = <Gift>[];

    for (final giftId in giftIds) {
      final giftSnapshot = await FirebaseFirestore.instance.collection('gifts').doc(giftId).get();
      if (giftSnapshot.exists) {
        final gift = Gift.fromMap(giftSnapshot.data()!);
        giftObjects.add(gift);
      }
    }

    return giftObjects;
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

