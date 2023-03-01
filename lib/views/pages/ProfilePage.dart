import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/aymen.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Aymen Jnayah"),
                  const Text("contactaymenjnayah@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 229, 250, 230),
                          side: BorderSide(width: 2.5, color: Colors.green),
                          shape: const StadiumBorder()),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: AppColor.primary_color,
                            fontFamily: 'poppins-regular'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    title: "Settings",
                    icon: Icons.settings,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "About Us",
                    icon: Icons.question_answer,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: "Terms & conditions",
                    icon: Icons.book,
                    onPress: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileMenuWidget(
                    title: "Log out",
                    icon: Icons.logout,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColor.primary_color.withOpacity(0.1),
        ),
        child: Icon(icon, color: AppColor.primary_color),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
      trailing: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.chevron_right,
                size: 30.0,
                color: Color.fromARGB(255, 81, 78, 78),
              ),
            )
          : null,
    );
  }
}
