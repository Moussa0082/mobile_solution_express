import 'package:flutter/material.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/GuideScreen.dart';
import 'package:solution_express/screens/LoginScreen.dart';
import 'package:solution_express/screens/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SpalshScreen(),
    );
  }
}


