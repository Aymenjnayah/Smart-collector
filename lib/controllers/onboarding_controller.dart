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
      'Unlock the Hidden Value',
      "oin Smart Collector to turn used items into valuable treasures. Explore a sustainable future where waste becomes wealth. Together, let's save the Earth while discovering the value in every item.",
    ),
    OnboardingInfo(
      'assets/images/image2.svg',
      "Repurpose for a Better Tomorrow",
      "Embrace Smart Collector to repurpose discarded items and make a difference. Discover hidden value in things others consider waste. Reduce waste, protect the planet, and save money with every step.",
    ),
    OnboardingInfo(
      'assets/images/image3.svg',
      "Green Living, Wealthy Living",
      "Experience sustainability and savings with Smart Collector. Repurpose used items for a greener lifestyle and unlock economic value. Create a greener and wealthier world by reducing waste and saving money.",
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
