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
            const SizedBox(height: 200),
            Expanded(
              child: Center(
                child: Image.asset('assets/images/logo.png', width: 300),
              ),
            ),
            const CircularProgressIndicator(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
