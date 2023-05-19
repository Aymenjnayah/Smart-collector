import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:smart_collector/config/base_controller.dart';

class LocationsController extends GetxController  with BaseController{
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  addAddress() async {
    showLoading();
    if (!_validateFields()) {
      hideLoading();
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    CollectionReference addressCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('address');

    DocumentReference docRef = await addressCollection.add({
      'city': cityController.text,
      'town': townController.text,
      'address': addressController.text,
      'comment': commentController.text,
      'latitude':  0.0,
      'longitude':  0.0,
    });

    hideLoading();
    String addedDocumentId = docRef.id;
    Get.back(result: addedDocumentId);
  }



  bool _validateFields() {
    return cityController.text.isNotEmpty &&
        townController.text.isNotEmpty &&
        addressController.text.isNotEmpty;
  }

  LocationData? _currentLocation;

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location services are not enabled, handle accordingly
        return;
      }
    }

    // Check if location permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Location permission not granted, handle accordingly
        return;
      }
    }

    // Get the current location
    _currentLocation = await location.getLocation();
  }
}
