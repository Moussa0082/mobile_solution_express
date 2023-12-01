
import 'package:flutter/material.dart';

class MyPaymentScreen extends StatefulWidget {
  const MyPaymentScreen({super.key});

  @override
  State<MyPaymentScreen> createState() => _MyPaymentScreenState();
}

class _MyPaymentScreenState extends State<MyPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Mes Paiements", style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 20),) ,
        centerTitle: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),

      body: Center(
        child: Column(
          
          children: [
            const SizedBox(height: 90,),
            Text("Aucun paiement effectuer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)),),
            const SizedBox(height: 90,),
            Image.asset("assets/image/pay.png"),
            const SizedBox(height: 90,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Expanded(child: Text("Vous n'avez pas de paimement\n  \t effectuer actuellement", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)),))),
          ],
        ),
      ),
    );
  }
}