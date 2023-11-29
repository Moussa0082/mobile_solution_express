
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:solution_express/Banques/TypeInfoScreen.dart';
import 'package:solution_express/models/TypeBanque.dart';
import 'package:solution_express/widgets/Carousel.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class TypeScreen extends StatefulWidget {
    final List<TypeBanque> typesBanque;
    String banque = "";
    

    TypeScreen({ super.key, required this.typesBanque, required this.banque});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBare(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
       
            // SizedBox(height: 2,),
            SizedBox(
            
            child: MyCarousel(),
          
            ),
             Text(widget.banque.toUpperCase(),
             style:TextStyle(fontSize: 25, color: Color(0xFF9A6ABB), fontWeight: FontWeight.bold) ,),
            const SizedBox(height:10),
          SingleChildScrollView(
              child: 
              
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.typesBanque.map((TypeBanque typeBanque) {
                  return GestureDetector(
                    onTap: () {
                      // Naviguez vers la page TypeInfoScreen avec les données du typeBanque
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TypeInfoScreen(
                            description: typeBanque.description,
                            nom: typeBanque.nom,
                            banque: typeBanque.banque!.nom,
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
                          Image.network(
                            "http://10.0.2.2/" +  typeBanque.image,
                            // Utilisez le champ image de votre objet TypeBanque
                            height: 80,
                            width: 80,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            typeBanque.nom,
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
                  );
                }).toList(),
              ),
            ),

          ],
        ),
      ),
    );
        
        
        
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
   
  }
}