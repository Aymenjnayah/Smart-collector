import 'package:flutter/material.dart';
import 'package:smart_collector/controllers/admin/admin_dashboard_controller.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AdminDashboardController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF373737),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Admin Dashboard",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
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
                _buildOption(
                  "Collections",
                  "#1EB15A",
                  "assets/images/collections_icon.png",
                  () {
                    controller.goToNextScreen(0);
                  },
                ),
                _buildOption(
                  "Users",
                  "#FFB109",
                  "assets/images/users_icon.png",
                  () {
                    controller.goToNextScreen(1);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOption(
                  "Requests",
                  "#373737",
                  "assets/images/requests_icon.png",
                  () {
                    controller.goToNextScreen(2);
                  },
                ),
                _buildOption(
                  "QR Scanner",
                  "#F7A48B",
                  "assets/images/scanner_icon.png",
                  () {
                    controller.goToNextScreen(3);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    String title,
    String colorHex,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 132,
        decoration: BoxDecoration(
          color:
              Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000),
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
            SizedBox(
              height: 10,
            ),
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
