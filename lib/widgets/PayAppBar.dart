
 import 'package:flutter/material.dart';

class PayAppBar extends StatefulWidget {
  const PayAppBar({super.key});

  @override
  State<PayAppBar> createState() => _PayAppBarState();
}

class _PayAppBarState extends State<PayAppBar> {
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
            Text("Aucun paiement effectuer"),
            const SizedBox(height: 10,),
            Image.asset("assets/image/pay.png"),
          ],
        ),
      ),
    );
  }
}