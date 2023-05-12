import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/profile_controller.dart';
import 'package:smart_collector/routes/app_routes.dart';
import '../../config/app_colors.dart';
import '../../widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Obx(() {
                    final currentUser = controller.currentUser.value;
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(currentUser.avatar),
                    );
                  }),
                  const SizedBox(height: 10),
                  Obx(() {
                    final currentUser = controller.currentUser.value;
                    return Text(currentUser.name);
                  }),
                  Obx(() {
                    final currentUser = controller.currentUser.value;
                    return Text(
                      currentUser.email,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.EditAccount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 229, 250, 230),
                        side: BorderSide(width: 2.5, color: Colors.green),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: AppColors.primary_color,
                          fontFamily: 'poppins-regular',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    title: "Settings",
                    icon: Icons.settings,
                    onPress: () {
                      Get.toNamed(AppRoutes.Settings);
                    },
                  ),
                  ProfileMenuWidget(
                    title: "About Us",
                    icon: Icons.question_answer,
                    onPress: () {
                      Get.toNamed(AppRoutes.AboutUs);
                    },
                  ),
                  ProfileMenuWidget(
                    title: "Terms & conditions",
                    icon: Icons.book,
                    onPress: () {
                      Get.toNamed(AppRoutes.Termsconditions);
                    },
                  ),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                    title: "Log out",
                    icon: Icons.logout,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      controller.logout();
                    },
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



