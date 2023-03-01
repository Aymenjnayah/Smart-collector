import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_collector/config/app_colors.dart';
import 'package:smart_collector/widgets/submit_button.dart';

import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';


class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome",style: GoogleFonts.poppins(fontSize: 32,color: AppColor.primary_color),),
                SizedBox(height: 10,),
                Text("Create an Account !",style: GoogleFonts.poppins(fontSize: 18,color: AppColor.Subtitle),),
                SizedBox(height: 20,),
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
               
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {} ,
                  // ignore: sort_child_properties_last
                  child: Text('Sign up'),
                  
                ),
                 // ignore: prefer_const_constructors
                 SizedBox(
                  height: 30.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

