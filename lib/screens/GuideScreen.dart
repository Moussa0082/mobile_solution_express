

import 'package:flutter/material.dart';
import 'package:solution_express/Banques/BankHomeScreen.dart';
import 'package:solution_express/Banques/BankNav.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(),
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: Column(
        children: <Widget>[
//           

   const SizedBox(height: 50,),

   GestureDetector(
    onTap:   (){
   Navigator.push(context,
   MaterialPageRoute(builder: (context) =>   BankNav()));
    },
     child: Container(
      margin:EdgeInsets.only(left:30),
      alignment:Alignment.center,
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color(0xFF9A6ABB),
      ),
      child: Row(
          children: [
            const SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Expanded(child: const
               Text(" Choisir une banque\n et faire une demande\n de créationn de compte\n ou d’obtention de carte \n" + " prépayée",
                style: TextStyle(color: Colors.white, fontSize: 20, ),)),
            ),
            const SizedBox(width: 10,),
            Icon(Icons.home, color: Colors.white, size: 100,),
           ],
      ),
     ),
   ),
     const SizedBox(height: 30),
   GestureDetector(
     child: Container(
      margin:EdgeInsets.only(left:30),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
         color: Color(0xFF9A6ABB),
      ),
      child: Row(
            children: [
            const SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(child: const Text(" Participer à une \n cotisation ou créer\n un  goupe pour une \n "  + "cotisation", 
              style: TextStyle(color: Colors.white, fontSize: 20, ),)),
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



//On will onTap

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Quitter l\'application ?'),
      content: Text('Êtes-vous sûr de vouloir quitter complètement l\'application ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // L'utilisateur ne veut pas quitter
          },
          child: Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // L'utilisateur veut quitter
          },
          child: Text('Quitter'),
        ),
      ],
    );
  }
}

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => ExitConfirmationDialog(),
  ) ?? false; // L'utilisateur a appuyé sur le bouton "retour" du matériel
}