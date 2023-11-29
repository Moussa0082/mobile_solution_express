
import 'package:flutter/material.dart';
import 'package:solution_express/Banques/AskFomrOneScreen.dart';
import 'package:solution_express/models/Banque.dart';
import 'package:solution_express/models/TypeBanque.dart';
import 'package:solution_express/widgets/TypeInfoCarousel.dart';

class TypeInfoScreen extends StatefulWidget {
  String description = "";
  String nom = "";
  String banque = "";
   TypeInfoScreen({super.key, required this.description, required this.nom, required this.banque});

  @override
  State<TypeInfoScreen> createState() => _TypeInfoScreenState();
}

class _TypeInfoScreenState extends State<TypeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.nom.toUpperCase(), style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 20),) ,
      centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 231, 229, 229),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // const SizedBox(height: 25,),
       
            // SizedBox(height: 2,),
            SizedBox(
            
            child: TypeInfoCarousel(),
          
            ),
             Text(widget.banque,
             style:TextStyle(fontSize: 25, color: Color(0xFF9A6ABB), fontWeight: FontWeight.bold) ,),
            const SizedBox(height:10),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AskFormOneScreen()),);
            }, child: Text('Faire une demande', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), ),
             ), style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              backgroundColor: Color(0xFF9A6ABB), fixedSize: Size(300, 30) ),
             
             ),
             const SizedBox(height: 20,),
           SingleChildScrollView(
             child:Container(
              // height: 200,
              width: 320,
              color:  (Colors.white),
               child: Column(
                children: [
                 const SizedBox(height: 10,),
                  Text(widget.nom, style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),),
                 const SizedBox(height: 10,),
                 Padding( padding: EdgeInsets.all(10),
                   child:  Text(widget.description, 
                   style: TextStyle(fontWeight: FontWeight.w500, fontSize:20), textAlign: TextAlign.justify,)),
                 const SizedBox(height: 16,),
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