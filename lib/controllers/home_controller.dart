import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../models/RequestModel.dart';
import '../models/user.dart';

class HomeController extends GetxController with BaseController{
  final myList = <RequestModel>[].obs;
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
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
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
      myList.value = requestDocs.docs
          .map<RequestModel>((doc) => RequestModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      hideLoading();
    } catch (e) {
      hideLoading();
      // Handle any errors
    }
  }

  void addItem() {}
}
