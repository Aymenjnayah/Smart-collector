import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../widgets/custum_text_field.dart';
import '../../widgets/submit_button.dart';

class LocationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter a location",
                  style: GoogleFonts.poppins(
                      fontSize: 32, color: AppColor.primary_color),
                ),
                SizedBox(height: 10),
                makeInput(hint: "Select city"),
                SizedBox(
                  height: 20.0,
                ),
                makeInput(hint: "Select town"),
                SizedBox(
                  height: 20.0,
                ),
                makeInput(hint: "Enter house address"),
                SizedBox(
                  height: 20.0,
                ),
                makeInput(hint: "Add comment"),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: Text(
                    'Add location',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
