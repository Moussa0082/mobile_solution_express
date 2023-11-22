

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solution_express/screens/LoginScreen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {



  @override
  void initState() {
    super.initState();

    Timer(
     const  Duration(seconds:5), 
      () =>
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      ),
      ),
     );
    
    
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
    body: 
     Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
                  'assets/image/logo.png',
                  height: 200,
                  width: 230,
                ),
               const SizedBox(
                  height: 5,
                ),
          ],
        )
        
      ),
      
    );
  //   Container(
  //     // Add box decoration
  //     decoration: BoxDecoration(
  //       // Box decoration takes a gradient
  //       gradient: LinearGradient(
  //         // Where the linear gradient begins and ends
  //         begin: Alignment.topRight,
  //         end: Alignment.bottomLeft,
  //         // Add one stop for each color. Stops should increase from 0 to 1
  //         stops: [0.1, 0.5, 0.7, 0.9],
  //         colors: [
  //           // Colors are easy thanks to Flutter's Colors class.
  //           Colors.indigo[800],
  //           Colors.indigo[700],
  //           Colors.indigo[600],
  //           Colors.indigo[400],
  //         ],
  //       ),
  //     ),
      
  //   ),
  // );
  }
}