
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:solution_express/Banques/TypeInfoScreen.dart';
import 'package:solution_express/widgets/Carousel.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // const SizedBox(height: 25,),
       
            // SizedBox(height: 2,),
            SizedBox(
            
            child: MyCarousel(),
          
            ),
            const Text("Espace BMS",
             style:TextStyle(fontSize: 25, color: Color(0xFF9A6ABB), fontWeight: FontWeight.bold) ,),
            const SizedBox(height:10),
           SingleChildScrollView(
             child: Wrap(
               spacing: 6,
               runSpacing: 6,
               children: [
                 // Première ligne
                 GestureDetector(
                   onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const TypeInfoScreen()),);
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => QuizDetail(categorie: 'Categorie1'),
                     //   ),
                     // );
                   },
             
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: const Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/courant.png', // Image statique
                 height: 80,
                 width: 80,
               ),
              const SizedBox(height: 10),
              const Text(
                 'Compte Courant', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
                 const SizedBox(width:5),
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => 
                     //     // QuizDetail(categorie: 'Categorie2')
                     //     ,
                     //   ),
                     // );
                   },
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: const Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/epargne.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'Compte Epargne', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => 
                     //     // QuizDetail(categorie: 'Categorie2')
                     //     ,
                     //   ),
                     // );
                   },
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/bloquer.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'Compte Bloquer', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
                 const SizedBox(width:5),
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => 
                     //     // QuizDetail(categorie: 'Categorie2')
                     //     ,
                     //   ),
                     // );
                   },
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/etudiant.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'Compte  Etudiant', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
        
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => 
                     //     // QuizDetail(categorie: 'Categorie2')
                     //     ,
                     //   ),
                     // );
                   },
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/visa.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'Carte Visa', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
                 const SizedBox(width:5),
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => 
                     //     // QuizDetail(categorie: 'Categorie2')
                     //     ,
                     //   ),
                     // );
                   },
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color.fromARGB(255, 226, 223, 223),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/master.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'MasterCard', // Nom statique
                 style: TextStyle(
                   color: Color(0xFF9A6ABB),
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
               ),
             ],
                     ),
                   ),
                 ),
                 // Ajoutez d'autres catégories ici...
               ],
             ),
           ),
        
        
        
          //  GestureDetector(
          //    child: Container(
          //     height: 200,
          //     width: 400,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(20)),
          //        color: Color(0xFF9A6ABB),
          //     ),
          //     child: Row(
          //         children: [
          //           const SizedBox(height: 1,),
          //           Padding(
          //             padding: const EdgeInsets.all(2.0),
          //             child: Expanded(child: const Text(" Choisir une banque\n et faire une demande\n de créationn de compte\n ou d’obtention de carte \n" + " prépayée", style: TextStyle(color: Colors.white, fontSize: 25, ),)),
          //           ),
          //           const SizedBox(width: 10,),
          //           Icon(Icons.home, color: Colors.white, size: 100,),
          //          ],
          //     ),
          //    ),
          //  ),
          //    const SizedBox(height: 30,),
          //  GestureDetector(
          //    child: Container(
          //     height: 200,
          //     width: 400,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(20)),
          //        color: Color(0xFF9A6ABB),
          //     ),
          //     child: Row(
             
          //           children: [
          //           const SizedBox(height: 1,),
          //           Padding(
          //             padding: const EdgeInsets.all(1.0),
          //             child: Expanded(child: const Text(" Participer à une \n cotisation ou créer\n un  goupe pour une \n "  + "cotisation", style: TextStyle(color: Colors.white, fontSize: 25, ),)),
          //           ),
          //           const SizedBox(width: 80,),
          //           // Icon(Icons.home, color: Colors.white, size: 100,),
          //           Image.asset('assets/image/guideim2.png'),
          //          ],
          //     ),
          //    ),
          //  )
        
          ],
        
        ),
      ),
    );
  }
}