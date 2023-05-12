import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_collector/config/base_controller.dart';

class EditAccountController extends GetxController with BaseController {

  final picker = ImagePicker();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Rx<File?> image = Rx(null);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var picture = ''.obs;

  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() => isPasswordVisible.toggle();

  @override
  void onReady() {
    super.onReady();
    getUserData();
  }



  Future<void> getUserData() async {
    showLoading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      final userData = await _db.collection('users').doc(user!.uid).get();
      nameController.text = userData['name'];
      emailController.text = userData['email'];
      phoneController.text = userData['phone'];
      picture.value = userData['avatar'];
      hideLoading();
    } catch (e) {
      hideLoading();
      print('Error fetching user data: $e');
    }
  }

  Future<void> selectImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      uploadImageToFirebaseStorage();
    }
  }

  Future<void> selectImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      uploadImageToFirebaseStorage();
    }
  }

  Future<void> uploadImageToFirebaseStorage() async {
    showLoading();
    final user = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance.ref().child('avatars/${user!.uid}');
    final uploadTask = storageRef.putFile(image.value!);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    await _db.collection('users').doc(user.uid).update({'avatar': downloadUrl});
    picture.value = downloadUrl;
    hideLoading();
  }

  void showImagePickerBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take a picture'),
              onTap: () {
                Get.back();
                selectImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Get.back();
                selectImageFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  void handleSettings() {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String phone = phoneController.text.trim();
    final String password = passwordController.text.trim();

    if (name.isEmpty) {
      // Show snackbar indicating that the name field is required
      Get.snackbar('Validation Error', 'Name field is required');
      return;
    }

    if (!phone.isPhoneNumber) {
      // Show snackbar indicating that the phone number is invalid
      Get.snackbar('Validation Error', 'Invalid phone number');
      return;
    }

    if (!email.isEmail) {
      // Show snackbar indicating that the email is invalid
      Get.snackbar('Validation Error', 'Invalid email address');
      return;
    }

    if (password.isNotEmpty && password.length < 6) {
      // Show snackbar indicating that password should be at least 6 characters long
      Get.snackbar('Validation Error', 'Password should be at least 6 characters long');
      return;
    }

    if (password.isNotEmpty) {
      // Show confirmation dialog if password is going to be changed
      Get.defaultDialog(
        title: 'Change Password',
        middleText: 'Are you sure you want to change your password?',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back(); // Close the dialog
          saveChanges(name, phone);
        },
        onCancel: () {
          Get.back(); // Close the dialog
        },
      );
    } else {
      saveChanges(name, phone);
    }
  }
  void saveChanges(String name, String phone) async {
    showLoading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      await _db.collection('users').doc(user!.uid).update({
        'name': name,
        'phone': phone,
      });
      hideLoading();
      // Show snackbar indicating that changes were saved successfully
      Get.snackbar('Success', 'Changes saved successfully');
    } catch (e) {
      hideLoading();
      // Show snackbar indicating that an error occurred
      Get.snackbar('Error', 'Failed to save changes');
      print('Error saving changes: $e');
    }
  }

}

