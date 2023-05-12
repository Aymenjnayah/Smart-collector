import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import '../../controllers/EditAccount_controller.dart';

class EditAccountPage extends StatelessWidget {
  final EditAccountController controller = Get.put(EditAccountController());

  EditAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Stack(
                  children: [
                     Obx(() => CircleAvatar(
                       radius: 70,
                       backgroundImage: NetworkImage(controller.picture.value),
                     )),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          controller.showImagePickerBottomSheet();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Name',
                controller: controller.nameController,
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Email',
                controller: controller.emailController,
                prefixIcon: const Icon(Icons.email),
                enabled: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Phone Number',
                controller: controller.phoneController,
                prefixIcon:  Icon(Icons.phone),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Password',
                controller: controller.passwordController,
                obscureText: !controller.isPasswordVisible.value,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
              SizedBox(height: 30,),
              SubmitButton(buttonText: "Save Changes", onPressed: () => {
                controller.handleSettings()
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomTextField({
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: const Color(0xFFC4C6C5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
      ),
    );
  }
}
