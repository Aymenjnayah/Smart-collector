import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditAccountController extends GetxController {

  final picker = ImagePicker();

  final Rx<File?> image = Rx(null);

  Future<void> selectImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> selectImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }


  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;

  void setName(String value) => name.value = value;
  void setEmail(String value) => email.value = value;
  void setPhone(String value) => phone.value = value;
  void setPassword(String value) => password.value = value;

  @override
  void onInit() {
    super.onInit();
    // Initialize your controller here, if needed
  }

  @override
  void onClose() {
    // Close resources, such as streams or sockets, here
    super.onClose();
  }

  void showImagePickerBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Take a picture'),
              onTap: () {
                Get.back();
                selectImageFromCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
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
}

