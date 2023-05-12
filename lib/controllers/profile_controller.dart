import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_collector/routes/app_routes.dart';
import '../models/user.dart';

class ProfileController extends GetxController {
  Rx<UserModel> currentUser = UserModel.empty().obs; // Initialize with empty UserModel

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
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

  String getProfileInitials() {
    String name = currentUser.value.name ?? '';
    List<String> nameParts = name.split(' ');
    if (nameParts.isNotEmpty) {
      String initials = '';
      for (String part in nameParts) {
        if (part.isNotEmpty) {
          initials += part[0];
        }
      }
      return initials;
    } else {
      return '';
    }
  }

  bool get hasProfilePicture {
    return currentUser.value.avatar != null &&
        currentUser.value.avatar.isNotEmpty;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}
