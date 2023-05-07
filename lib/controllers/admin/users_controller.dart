import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/base_controller.dart';

import '../../models/user.dart';

class UsersController extends GetxController with BaseController {
  final users = <User>[].obs;
  final searchText = ''.obs;

  @override
  void onReady() {
    super.onReady();
    loadUsers();
  }

  void loadUsers() async {
    showLoading();
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    users.assignAll(snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
    hideLoading();
  }

  void setSearchText(String text) {
    searchText.value = text;
  }

  List<User> get filteredUsers {
    if (searchText.value.isEmpty) {
      return users;
    } else {
      return users.where((user) => user.name.toLowerCase().contains(searchText.value.toLowerCase())).toList();
    }
  }
}
