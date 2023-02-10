import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Center(
              child: Image.asset('assets/images/logo.png', width: 300,),
            ),
            CircularProgressIndicator(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
