import 'package:flutter/material.dart';
import 'package:solution_express/Banques/TypesScreen.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class BankHome extends StatefulWidget {
  const BankHome({super.key});

  @override
  State<BankHome> createState() => _BankHomeState();
}

class _BankHomeState extends State<BankHome> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25,),
        //     Container(
        //       height: 70,
        //       child:Container(
          
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     border: Border.all(color: Colors.grey), 
        //   ),
        //   child: Row(
        //     children: [
        // const SizedBox(height: 130, width: 5,),
        // CircleAvatar(
        //   radius: 30,
        //   backgroundColor: const Color(0xFF9A6ABB),
        //   child: SizedBox.fromSize(
        //     size: const Size.fromRadius(60),
        //     child: ClipOval(
        //       child: Image.asset(
        //         'assets/image/me.jpg',
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(width: 10,),
        // const Text(
        //   'Moussa Bane',
        //   style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
        // ),
        // const SizedBox(width: 90,),
        // CircleAvatar(
        //   radius: 30,
        //   backgroundColor:const Color(0xFF9A6ABB),
        //   child: SizedBox.fromSize(
        //     child:const  ClipOval(
        //       child: Icon(Icons.notifications, size: 40,color: Colors.white,),
        //     ),
        //   ),
        // )
        //     ],
        //   ),
        //  ),
        
        //    ),
        
           const SizedBox(height: 8,),
           Container(
            padding:EdgeInsets.all(10),
             child: Column(
         children: [
           Row(
             children: [
               Expanded(
                 child: Container(
                   padding: EdgeInsets.only(left: 5),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30),
                     // boxShadow: [
                     //   BoxShadow(
                     //     color: Colors.grey.shade300,
                     //     blurRadius: 4,
                     //     offset: Offset(0, 3),
                     //   ),
                     // ],
                   ),
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: 'Rechercher',
                       contentPadding: EdgeInsets.all(10),
                       border: InputBorder.none,
                     ),
                   ),
                 ),
               ),
               SizedBox(width: 10),
               Container(
                 height: 50,
                 width: 50,
                 decoration: BoxDecoration(
                   // boxShadow: [
                   //   BoxShadow(
                   //     color: Colors.grey.shade300,
                   //     blurRadius: 4,
                   //     offset: Offset(0, 4),
                   //   ),
                   // ],
                   borderRadius: BorderRadius.all(
                     Radius.circular(25),
                   ),
                 ),
                 child: ElevatedButton(
                   onPressed: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) {
                     //       return CalendarPage();
                     //     },
                     //   ),
                     // );
                   },
                   child: Icon(
                     Icons.search,
                     color: Colors.white,
                     size: 26,
                   ),
                   style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.all(10),
                     shape: CircleBorder(),
                     shadowColor: Colors.white,
                     primary: Color(0xFF9A6ABB),
                   ),
                 ),
               )
             ],
           ),
          
             
         ],
             ),
           ),
        
            const SizedBox(height:10),
           SingleChildScrollView(
             child: Wrap(
               spacing: 6,
               runSpacing: 6,
               children: [
                 // Première ligne
                 GestureDetector(
                   onTap: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => QuizDetail(categorie: 'Categorie1'),
                     //   ),
                     // );
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> TypeScreen() ));
                   },
             
                   child: Container(
                     width: 165,
                     height: 165,
                     decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color(0xFFFFFFFF),
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/bms.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'BMS', // Nom statique
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
                                         Navigator.push(context,MaterialPageRoute(builder: (context)=> TypeScreen() ));
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
             color: Colors.white,
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/uba.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'UBA', // Nom statique
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
             color: Colors.white,
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/bnda.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'BNDA', // Nom statique
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
             color: Colors.white,
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/bim.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'BIM SA', // Nom statique
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
             color: Colors.white,
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/ecobank.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'ECOBANK', // Nom statique
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
             color: Colors.white,
                     ),
                     child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/image/coris.png', // Image statique
                 height: 80,
                 width: 80,
               ),
               SizedBox(height: 10),
               Text(
                 'CORIS BANK', // Nom statique
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