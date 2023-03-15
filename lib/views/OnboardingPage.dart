import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/controllers/onboarding_controller.dart';
import 'package:smart_collector/widgets/submit_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Text(
                        _controller.onboardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _controller.onboardingPages.length,
                              (index) => Obx(() {
                            return Container(
                              margin: EdgeInsets.only(right: 5),
                              width: _controller.selectedPageIndex.value == index ? 25 : 12,
                              height: 12,
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
                    Positioned(
                      child: ElevatedButton(
                        style: buttonPrimary,
                        onPressed: _controller.forwardAction,
                        child: Obx(() {
                          return Text(_controller.isLastPage ? 'Start' : 'Next', style: GoogleFonts.poppins(fontSize: 18));
                        }),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
