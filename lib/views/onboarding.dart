import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/onboarding_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            _controller.onboardingPages[index].imageAsset,
                            width: 250,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            _controller.onboardingPages[index].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 64.0),
                            child: Text(
                              _controller.onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ]),
                  );
                }),
            Positioned(
              bottom: 40,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            width: _controller.selectedPageIndex.value == index
                                ? 25
                                : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? Colors.green
                                      : Colors.grey,
                            ),
                          );
                        })),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: _controller.isLastPage == true
                    ? () {
                        Navigator.pushNamed(context, '/SignInPage');
                        print('Navigating to SignInPage');
                      }
                    : _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
