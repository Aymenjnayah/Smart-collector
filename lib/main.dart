import 'package:flutter/material.dart';
import 'package:smart_collector/views/splash.dart';
import 'package:smart_collector/views/Onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart collector',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/Onboarding': (context) => Onboarding(),
        '/SignInPage': (context) => SignInPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(),
    );
  }
}
