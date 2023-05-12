import 'package:flutter/material.dart';
import 'package:smart_collector/controllers/admin/admin_dashboard_controller.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AdminDashboardController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF373737),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildOption(
                  "Collections",
                  "#1EB15A",
                  "assets/images/collections_icon.png",
                      () => controller.goToNextScreen(0),
                ),
                buildOption(
                  "Users",
                  "#FFB109",
                  "assets/images/users_icon.png",
                      () => controller.goToNextScreen(1),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildOption(
                  "Requests",
                  "#373737",
                  "assets/images/requests_icon.png",
                      () => controller.goToNextScreen(2),
                ),
                buildOption(
                  "QR Scanner",
                  "#F7A48B",
                  "assets/images/scanner_icon.png",
                      () => controller.goToNextScreen(3),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            controller.handleLogout();
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }

  Widget buildOption(
      String title,
      String colorHex,
      String imagePath,
      VoidCallback onTap,
      ) {
    final color = Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 132,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 64,
              height: 64,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
