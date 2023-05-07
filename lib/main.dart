import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/bindings/SignInBindings.dart';
import 'package:smart_collector/bindings/admin/admin_add_gift_binding.dart';
import 'package:smart_collector/bindings/admin/admin_dashboard_binding.dart';
import 'package:smart_collector/routes/app_pages.dart';
import 'package:smart_collector/views/SignInPage.dart';
import 'package:smart_collector/views/pages/admin/admin_add_gift_page.dart';
import 'package:smart_collector/views/pages/admin/admin_dashboard_page.dart';
import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AdminDashboardBinding(),
      home:  AdminDashboardPage(),
      getPages: AppPages.pages,
    );
  }
}
