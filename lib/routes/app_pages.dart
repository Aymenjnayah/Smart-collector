
import 'package:get/get.dart';
import '../bindings/OnBoardingBinding.dart';
import '../bindings/SignInBindings.dart';
import '../bindings/SignUpBinding.dart';
import '../bindings/SplashBinding.dart';
import '../views/OnboardingPage.dart';
import '../views/SignInPage.dart';
import 'app_routes.dart';
import '../views/SplashPage.dart';
import '../views/SignUpPage.dart';

class AppPages {
  static final List<GetPage> pages = [
     GetPage(
      name: AppRoutes.splash,
      page: () =>  SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Onboarding,
      page: () =>  OnboardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
  ];
}