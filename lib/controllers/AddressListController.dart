

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';
import 'package:smart_collector/routes/app_routes.dart';

import '../models/Address.dart';

class AddressListController extends GetxController with BaseController {
  RxList<Address> addressList = RxList<Address>();

  @override
  void onReady() {
    super.onReady();
    fetchAddressList();
  }

  void fetchAddressList() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final usersCollection = FirebaseFirestore.instance.collection('users');
      final userDoc = usersCollection.doc(userId);
      final addressCollection = userDoc.collection('address');

      addressCollection.snapshots().listen((snapshot) {
        final addresses = snapshot.docs.map((doc) => Address.fromSnapshot(doc)).toList();
        addressList.value.clear();
        addressList.value = addresses;
      });
    }
  }

  void goToAddAddress() {
    Get.toNamed(AppRoutes.locations)?.then((addedDocumentId) {
      if (addedDocumentId != null && addedDocumentId is String) {
        fetchAddressList();
      }
    });
  }

  void removeAddress(String uid) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final usersCollection = FirebaseFirestore.instance.collection('users');
      final userDoc = usersCollection.doc(userId);
      final addressCollection = userDoc.collection('address');

      addressCollection.doc(uid).delete().then((value) {
        addressList.removeWhere((address) => address.uid == uid);
      }).catchError((error) {
        // Handle error if necessary
      });
    }
  }

}
