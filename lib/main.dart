import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/GuideScreen.dart';
import 'package:solution_express/screens/LoginScreen.dart';
import 'package:solution_express/screens/SplashScreen.dart';
import 'package:solution_express/services/BanqueService.dart';
import 'package:solution_express/services/BottomNavigationService.dart';
import 'package:solution_express/services/UtilisateurService.dart';


   
void main() {
  
  runApp(
      MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => BottomNavigationService()),
         ChangeNotifierProvider(create: (context) => UtilisateurProvider()),
         ChangeNotifierProvider(create: (context) => UtilisateurService()),
          ChangeNotifierProvider(create: (_) => BanqueService()),
       ],
       child:  const MyApp()),
  );
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


