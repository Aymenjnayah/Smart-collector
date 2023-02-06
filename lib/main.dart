import 'package:flutter/material.dart';
import 'package:smart_collector/splash.dart';
import 'splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart collector',
      debugShowCheckedModeBanner: false,
      
      home: Splash(),
    );
  }
}



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Center(),
    );
  }

