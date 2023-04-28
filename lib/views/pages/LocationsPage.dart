import 'package:flutter/material.dart';
import 'package:smart_collector/controllers/Locations_controller.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';

import '../../widgets/CustomTextField.dart';

class LocationsPage extends StatelessWidget {
  LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LocationsController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "Set your location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                CustomTextField(
                  title: 'Select City',
                  controller: controller.cityController,
                ),
                CustomTextField(
                  title: 'Select town ',
                  controller: controller.townController,
                ),
                CustomTextField(
                  title: 'Enter house address ',
                  controller: controller.addressController,
                ),
                CustomTextField(
                  title: 'Add comment',
                  controller: controller.commentController,
                  isMultiline: true,
                ),
                SubmitButton(
                    buttonText: "Add New Adress",
                    onPressed: () => {controller.addAddress()})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
