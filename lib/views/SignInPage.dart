import 'package:flutter/material.dart';

import '../widgets/custum_text_field.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
            makeInput(hint: "Password",icon: Icon(Icons.password)),
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
          ],
        ),
      ),
    );
  }
}

