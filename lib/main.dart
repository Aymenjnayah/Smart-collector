import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_collector/routes/app_pages.dart';
import 'package:smart_collector/views/OnboardingPage.dart';

import 'bindings/OnBoardingBinding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: OnBoardingBinding(),
      home:  OnboardingPage(),
      getPages: AppPages.pages,
    );
  }
}

