

import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 25,),
          Container(
            height: 70,
            child:Container(
  // padding: EdgeInsets.all(1), // Ajoutez du padding si nécessaire
  // margin: EdgeInsets.all(2), // Ajoutez des marges si nécessaire
  decoration: BoxDecoration(
    color: Colors.white,
    // borderRadius: BorderRadius.circular(8), // Ajoutez un rayon pour les coins
    border: Border.all(color: Colors.grey), // Ajoutez une bordure avec la couleur de votre choix
  ),
  child: Row(
    children: [
      const SizedBox(height: 130, width: 5,),
      CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xFF9A6ABB),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(60),
          child: ClipOval(
            child: Image.asset(
              'assets/image/me.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(width: 10,),
      const Text(
        'Moussa Bane',
        style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 95,),
      CircleAvatar(
        radius: 30,
        backgroundColor:const Color(0xFF9A6ABB),
        child: SizedBox.fromSize(
          child:const  ClipOval(
            child: Icon(Icons.notifications, size: 40,color: Colors.white,),
          ),
        ),
      )
    ],
  ),
 ),

   ),

   const SizedBox(height: 50,),

   GestureDetector(
     child: Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color(0xFF9A6ABB),
      ),
      child: Row(
          children: [
            const SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Expanded(child: const Text(" Choisir une banque\n et faire une demande\n de créationn de compte\n ou d’obtention de carte \n" + " prépayée", style: TextStyle(color: Colors.white, fontSize: 25, ),)),
            ),
            const SizedBox(width: 10,),
            Icon(Icons.home, color: Colors.white, size: 100,),
           ],
      ),
     ),
   ),
     const SizedBox(height: 30,),
   GestureDetector(
     child: Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color(0xFF9A6ABB),
      ),
      child: Row(
           
            children: [
            const SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(child: const Text(" Participer à une \n cotisation ou créer\n un  goupe pour une \n "  + "cotisation", style: TextStyle(color: Colors.white, fontSize: 25, ),)),
            ),
            const SizedBox(width: 80,),
            // Icon(Icons.home, color: Colors.white, size: 100,),
            Image.asset('assets/image/guideim2.png'),
           ],
      ),
     ),
   )

        ],

      ),

      
    );
  }
}