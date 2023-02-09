import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/app_routes.dart';
import '../widgets/custum_text_field.dart';


class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            makeInput(hint: "Email",icon: Icon(Icons.email)),
            SizedBox(
              height: 20.0,
            ),
            makeInput(hint: "Password",icon: Icon(Icons.lock),),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () {} ,
              // ignore: sort_child_properties_last
              child: Text('Sign in'),
              backgroundColor: Colors.green,
              
            ),
             SizedBox(
              height: 40.0,
            ),
            Row(
              // ignore: sort_child_properties_last
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {Get.offNamed(AppRoutes.register);} 
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

