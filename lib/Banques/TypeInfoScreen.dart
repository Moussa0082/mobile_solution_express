
import 'package:flutter/material.dart';
import 'package:solution_express/Banques/AskFomrOneScreen.dart';
import 'package:solution_express/widgets/TypeInfoCarousel.dart';

class TypeInfoScreen extends StatefulWidget {
  const TypeInfoScreen({super.key});

  @override
  State<TypeInfoScreen> createState() => _TypeInfoScreenState();
}

class _TypeInfoScreenState extends State<TypeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Compte courant', style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 20),) ,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // const SizedBox(height: 25,),
       
            // SizedBox(height: 2,),
            SizedBox(
            
            child: TypeInfoCarousel(),
          
            ),
            const Text("Espace BMS",
             style:TextStyle(fontSize: 25, color: Color(0xFF9A6ABB), fontWeight: FontWeight.bold) ,),
            const SizedBox(height:10),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AskFormOneScreen()),);
            }, child: Text('Faire une demande', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), ),
             ), style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              backgroundColor: Colors.white, fixedSize: Size(300, 30) ),
             
             ),
             const SizedBox(height: 20,),
           SingleChildScrollView(
             child:Container(
              height: 200,
              width: 320,
              color: const Color.fromARGB(255, 218, 216, 213),
               child: Column(
                children: [
                 const SizedBox(height: 10,),
                 const Text("Compte courant", style: TextStyle(fontWeight: FontWeight.bold),),
                 const SizedBox(height: 10,),
                 Expanded(child:
                  Padding( padding: EdgeInsets.all(10),
                    child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", style: TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.justify,)),),
                ],
                
               ),
             ),
           ),
        
        
        
          
        
          ],
        
        ),
      ),
    );
  }
}