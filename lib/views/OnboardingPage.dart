import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/onboarding_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/SubmitButton.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 80,
            child: PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        _controller.onboardingPages[index].imageAsset,
                        width: 250,
                      ),
                      SizedBox(height: 32),
                      Text(
                        _controller.onboardingPages[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          _controller.onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 32),

                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _controller.onboardingPages.length,
                            (index) => Obx(() {
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            width: _controller.selectedPageIndex.value == index ? 20 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _controller.selectedPageIndex.value == index ? Colors.green : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  SubmitButton(
                    buttonText: _controller.isLastPage ? 'Start' : 'Next',
                    onPressed: _controller.forwardAction,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
