
import 'package:get/get.dart';
import '../bindings/OnBoardingBinding.dart';
import '../bindings/SignInBindings.dart';
import '../views/OnboardingPage.dart';
import '../views/SignInPage.dart';
import 'app_routes.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.Onboarding,
      page: () =>  OnboardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () =>  SignInPage(),
      binding: SignInBinding(),
    ),
  ];
}