import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/bindings/SplashBinding.dart';
import 'package:smart_collector/routes/app_pages.dart';

import 'package:smart_collector/views/SplashPage.dart';
import 'package:smart_collector/views/pages/new_request/NewRequestPage_step1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      //initialBinding: SplashBinding(),
      home: NewRequestPageStepOne(),
      //getPages: AppPages.pages,
    );
  }
}
