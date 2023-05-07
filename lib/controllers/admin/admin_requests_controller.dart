import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../../models/RequestModel.dart';
import '../../models/user.dart';

class AdminRequestsController extends GetxController with BaseController {
  final myList = <RequestModel>[].obs;
  final searchText = ''.obs;

  @override
  void onReady() {
    super.onReady();
    loadRequests();
  }

  void loadRequests() async {
    showLoading();
    final requests = await FirebaseFirestore.instance.collection('requests').get();
    final users = await FirebaseFirestore.instance.collection('users').get();

    final requestList = requests.docs.map((doc) {
      final request = RequestModel.fromMap(doc.data());
      final userDoc = users.docs.firstWhere((userDoc) => userDoc.id == request.userUid);
      final user = User.fromMap(userDoc.data());
      return request.copyWith(user: user);
    }).toList();

    myList.assignAll(requestList);
    hideLoading();
  }


  void setSearchText(String text) {
    searchText.value = text;
  }

  List<RequestModel> get filteredRequests {
    if (searchText.value.isEmpty) {
      return myList;
    } else {
      return myList.where((request) => request.gift.toLowerCase().contains(searchText.value.toLowerCase())).toList();
    }
  }
}
