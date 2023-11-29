


   
import 'package:flutter/material.dart';
import 'package:solution_express/Banques/AskFomrOneScreen.dart';
import 'package:solution_express/widgets/MyAppBar.dart';
import 'package:solution_express/widgets/TypeInfoCarousel.dart';

class BankAskStateScreen extends StatefulWidget {
  const BankAskStateScreen({super.key});

  @override
  State<BankAskStateScreen> createState() => _BankAskStateScreenState();
}

class _BankAskStateScreenState extends State<BankAskStateScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: 
        MyAppBare(),

      backgroundColor: Color.fromARGB(252, 247, 246, 246),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25,),
       
                       
            //  const SizedBox(height: 20,),
                 const Text("Demande en cours de traitement", style: TextStyle(fontWeight: FontWeight.bold, fontSize:25, color:Color(0xFF9A6ABB)),),
           SingleChildScrollView(
             child:Container(
              margin:EdgeInsets.all(20),
              height: 350,
              width: double.infinity,
              color:  Colors.white,
               child: Column(
                // crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                 
           const SizedBox(height:10),
                 Expanded(child:
                  Padding( padding: EdgeInsets.all(10),
                    child:  Expanded(
                      child:  Text("Votre demande est en cours de traitement veuillez patienter jusqu’à ce qu’un agent examine vos dossiers , et après si l’agent valide votre demande vous aller venir finaliser le processus final à la banque et  dans le cas contraire vous  pouvez consulter votre email vous y trouverer les raisons de rejet de votre demande. ", 
                      style:  TextStyle(fontWeight: FontWeight.w500,fontSize:22), textAlign: TextAlign.justify),
                    ),),),
                   
                ],
                
               ),
             ),
           ),
                     const SizedBox(height: 30,),

                      ElevatedButton(onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>AskFormOneScreen()),);
            }, child: Text('Annuler la demande', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), ),
             ), style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              backgroundColor: Color(0xFF9A6ABB), fixedSize: Size(300, 30) ),
             
             ),

        
        
        
          
        
          ],
        
        ),
      ),
    );
  }
}