import 'package:get/get.dart';
import 'package:smart_collector/bindings/AddressListBinding.dart';
import 'package:smart_collector/bindings/admin/admin_add_gift_binding.dart';
import 'package:smart_collector/bindings/admin/admin_collection_binding.dart';
import 'package:smart_collector/bindings/admin/admin_dashboard_binding.dart';
import 'package:smart_collector/bindings/admin/admin_requests_binding.dart';
import 'package:smart_collector/bindings/admin/users_binding.dart';
import 'package:smart_collector/views/pages/AboutUsPage.dart';
import 'package:smart_collector/views/pages/AddressListPage.dart';
import 'package:smart_collector/views/pages/SettingsPage.dart';
import 'package:smart_collector/views/pages/TermsConditionsPage.dart';
import 'package:smart_collector/views/pages/admin/admin_add_gift_page.dart';
import 'package:smart_collector/views/pages/admin/admin_collections_page.dart';
import 'package:smart_collector/views/pages/admin/admin_dashboard_page.dart';
import 'package:smart_collector/views/pages/admin/admin_requests_page.dart';
import 'package:smart_collector/views/pages/admin/admin_scanner_page.dart';
import 'package:smart_collector/views/pages/admin/users_page.dart';
import 'package:smart_collector/views/pages/new_request/NewRequestPage_Step3.dart';
import '../bindings/EditAccountBinding.dart';
import '../bindings/EnterPasswordBinding.dart';
import '../bindings/ForgetPasswordBinding.dart';
import '../bindings/NewRequestBinding.dart';
import '../bindings/NewRequestStepThreeBinding.dart';
import '../bindings/NewRequestStepTwoBinding.dart';
import '../bindings/OnBoardingBinding.dart';
import '../bindings/DashboardBinding.dart';
import '../bindings/LocationsBinding.dart';
import '../bindings/RequestDetailsBinding.dart';
import '../bindings/VerifyAccountBinding.dart';
import '../bindings/admin/admin_scanner_binding.dart';
import '../bindings/notificationsBinding.dart';
import '../bindings/profileBinding.dart';
import '../bindings/SignInBindings.dart';
import '../bindings/SignUpBinding.dart';
import '../bindings/SplashBinding.dart';
import '../views/OnboardingPage.dart';
import '../views/SignInPage.dart';
import '../views/SplashPage.dart';
import '../views/SignUpPage.dart';
import '../views/pages/DashboardPage.dart';
import '../views/pages/NotificationsPage.dart';
import '../views/pages/LocationsPage.dart';
import '../views/pages/ProfilePage.dart';
import '../views/pages/EditAccountPage.dart';
import '../views/pages/EnterPasswordPage.dart';
import '../views/pages/ForgetPasswordPage.dart';
import '../views/pages/new_request/NewRequestPage_step1.dart';
import '../views/pages/new_request/NewRequestPage_step2.dart';
import '../views/pages/RequestDetailsPage.dart';
import '../views/pages/VerifyAccountPage.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Onboarding,
      page: () => OnboardingPage(),
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
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.locations,
      page: () => LocationsPage(),
      binding: LocationsBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationsPage(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.EditAccount,
      page: () => EditAccountPage(),
      binding: EditAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.EnterPassword,
      page: () => EnterPasswordPage(),
      binding: EnterPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.ForgetPassword,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.NewRequest1,
      page: () => NewRequestPageStepOne(),
      binding: NewRequestBinding(),
    ),
    GetPage(
      name: AppRoutes.NewRequest2,
      page: () => NewRequestPageSteptwo(),
      binding: NewRequestStepTwoBinding(),
    ),
    GetPage(
      name: AppRoutes.RequestDetails,
      page: () => RequestDetailsPage(),
      binding: RequestDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.VerifyAccount,
      page: () => VerifyAccountPage(),
      binding: VerifyAccountBinding(),
    ),
    GetPage(
      name: AppRoutes.Settings,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: AppRoutes.Termsconditions,
      page: () => TermsConditionsPage(),
    ),
    GetPage(
      name: AppRoutes.AboutUs,
      page: () => AboutUsPage(),
    ),
    GetPage(
      name: AppRoutes.NewRequest3,
      page: () => NewRequestPageStepThree(),
      binding: NewRequestStepThreeBinding(),
    ),
    GetPage(
      name: AppRoutes.adminDahboard,
      page: () => AdminDashboardPage(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => UsersPage(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: AppRoutes.adminRequests,
      page: () => AdminRequestsPage(),
      binding: AdminRequestsBinding(),
    ),
    GetPage(
      name: AppRoutes.adminScanner,
      page: () => AdminScannerPage(),
      binding: AdminScannerBinding(),
    ),
    GetPage(
      name: AppRoutes.adminCollections,
      page: () => AdminCollectionsPage(),
      binding: AdminCollectionsBinding(),
    ),
    GetPage(
      name: AppRoutes.adminAddGift,
      page: () => AdminAddGiftPage(),
      binding: AdminAddGiftBinding(),
    ),
    GetPage(
      name: AppRoutes.listAddress,
      page: () => AddressListPage(),
      binding: AddressListBinding(),
    ),
  ];
}
