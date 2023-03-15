import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/models/onboarding_info.dart';
import 'package:smart_collector/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final selectedPageIndex = 0.obs;
  final pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  final List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/images/image1.svg',
      'This is title 1',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    OnboardingInfo(
      'assets/images/image2.svg',
      'This is title 2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    OnboardingInfo(
      'assets/images/image3.svg',
      'This is title 3',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  void forwardAction() {
    if (isLastPage) {
      Get.offNamed(AppRoutes.login);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }
}
