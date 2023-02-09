import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';


class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            makeInput(hint: " confirm Password",icon: Icon(Icons.lock),obscureText: true),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () {} ,
              // ignore: sort_child_properties_last
              child: Text('Sign up'),
              backgroundColor: Colors.green,
              
            ),
             SizedBox(
              height: 40.0,
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
    );
  }
}

