import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_collector/config/base_controller.dart';
import 'package:smart_collector/models/Request.dart';
import '../../models/Gift.dart';


class AdminRequestsController extends GetxController with BaseController {
  final myList = <Request>[].obs;
  final searchText = ''.obs;

  @override
  void onReady() {
    super.onReady();
    loadRequests();
  }

  void loadRequests() async {
    showLoading();
    final requests = await FirebaseFirestore.instance.collection('requests').get();

    final requestList = requests.docs.map((doc) async {
      final request = Request.fromMap(doc.data(),doc.id);

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


  void setSearchText(String text) {
    searchText.value = text;
  }

  List<Request> get filteredRequests {
    if (searchText.value.isEmpty) {
      return myList;
    } else {
      final searchQuery = searchText.value.toLowerCase();
      return myList.where((request) {
        final giftNames = request.giftObjects?.map((gift) => gift.title.toLowerCase()) ?? [];
        return giftNames.any((name) => name.contains(searchQuery));
      }).toList();
    }
  }

  showQrCode(String? docId) {
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
                data: docId ?? '',
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
