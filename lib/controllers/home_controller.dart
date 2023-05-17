import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/RequestModel.dart';
import '../models/user.dart';

class HomeController extends GetxController {
  final myList = <RequestModel>[].obs;
  Rx<UserModel> currentUser = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
    myList.addAll([
      /*  RequestModel(liters: 4, gift: 'Pack Nadhif', date: 'Mon, Oct 24'),
        RequestModel(liters: 14, gift: 'Pack javel', date: 'Wed, Oct 26'),
        RequestModel(liters: 7, gift: 'Pack rose...', date: 'Mon, Oct 31'),
        RequestModel(liters: 7, gift: '2 pack nadhif', date: 'Mon, Nov 04'),*/
    ]);
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

  void addItem() {
    //myList.add(RequestModel(liters: 7, gift: '2 pack lepi...', date: 'Mon, Nov 29'));
  }
}