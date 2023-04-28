import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/app_colors.dart';
import 'package:smart_collector/config/values_manager.dart';
import 'package:smart_collector/widgets/SubmitButton.dart';
import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';


class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: AppSize.hs100,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.fs20 * 2,
                      color: AppColor.primary_color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.hs10,
                  ),
                  const Text(
                    "Create an Account !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: AppColor.Subtitle,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  makeInput(hint: "Name",icon: Icon(Icons.person)),
                  SizedBox(
                    height: 20.0,
                  ),
                  makeInput(hint: "Email",icon: Icon(Icons.email)),
                  SizedBox(
                    height: 20.0,
                  ),
                  makeInput(hint: "Phone number",icon: Icon(Icons.phone)),
                  SizedBox(
                    height: 20.0,
                  ),
                  makeInput(hint: "Password",icon: Icon(Icons.lock),obscureText: true),
                  SizedBox(
                    height: 20.0,
                  ),
                  SubmitButton(buttonText: "Sign up", onPressed: ()=>{

                  })
                ],
              ),
              Row(
                // ignore: sort_child_properties_last
                children: <Widget>[
                  const Text('Already have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {Get.offNamed(AppRoutes.login);}
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

