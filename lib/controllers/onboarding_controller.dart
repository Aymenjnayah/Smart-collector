import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length -1;
  var pageController = PageController();
  forwardAction() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('images/image1.svg', 'this is title 1',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    OnboardingInfo('images/image2.svg', 'this is title 2',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    OnboardingInfo('images/image3.svg', 'this is title 3',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
  ];
}
