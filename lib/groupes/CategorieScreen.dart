

import 'package:flutter/material.dart';
import 'package:solution_express/groupes/CreateGroupeScreen.dart';
import 'package:solution_express/widgets/GroupeCarousel.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBare(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
       
            // SizedBox(height: 2,),
            SizedBox(
            
            child: GroupeCarousele(),
          
            ),
             Text("",
             style:TextStyle(fontSize: 25, color: Color(0xFF9A6ABB), fontWeight: FontWeight.bold) ,),
            const SizedBox(height:10),
          SingleChildScrollView(
              child: 
              
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
      GestureDetector(
                    onTap: () {
                      // Naviguez vers la page TypeInfoScreen avec les données du typeBanque
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupeScreen(
                            // description: typeBanque.description,
                            // nom: typeBanque.nom,
                            // banque: typeBanque.banque!.nom,
                            // typesBanque:typeBanque,
                          ),
                        ),
                      );
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
                            "assets/image/bnda.png"
                           
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Groupes d'amie",
                            // Utilisez le champ nom de votre objet TypeBanque
                            style: TextStyle(
                              color: Color(0xFF9A6ABB),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

// end 

// two 

 GestureDetector(
                    onTap: () {
                      // Naviguez vers la page TypeInfoScreen avec les données du typeBanque
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupeScreen(
                            // description: typeBanque.description,
                            // nom: typeBanque.nom,
                            // banque: typeBanque.banque!.nom,
                            // typesBanque:typeBanque,
                          ),
                        ),
                      );
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
                            "assets/image/bnda.png"
                           
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Groupes d'amie",
                            // Utilisez le champ nom de votre objet TypeBanque
                            style: TextStyle(
                              color: Color(0xFF9A6ABB),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // end two 

                  // three 
                   GestureDetector(
                    onTap: () {
                      // Naviguez vers la page TypeInfoScreen avec les données du typeBanque
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupeScreen(
                            // description: typeBanque.description,
                            // nom: typeBanque.nom,
                            // banque: typeBanque.banque!.nom,
                            // typesBanque:typeBanque,
                          ),
                        ),
                      );
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
                            "assets/image/bnda.png"
                           
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Groupes d'amie",
                            // Utilisez le champ nom de votre objet TypeBanque
                            style: TextStyle(
                              color: Color(0xFF9A6ABB),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // end three 


                  // foor 
                   GestureDetector(
                    onTap: () {
                      // Naviguez vers la page TypeInfoScreen avec les données du typeBanque
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupeScreen(
                            // description: typeBanque.description,
                            // nom: typeBanque.nom,
                            // banque: typeBanque.banque!.nom,
                            // typesBanque:typeBanque,
                          ),
                        ),
                      );
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
                            "assets/image/bnda.png"
                           
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Groupes d'amie",
                            // Utilisez le champ nom de votre objet TypeBanque
                            style: TextStyle(
                              color: Color(0xFF9A6ABB),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // end foor 


                ]
                   
  
              ),
            ),

          ],
        ),
      ),
    );
  }
}