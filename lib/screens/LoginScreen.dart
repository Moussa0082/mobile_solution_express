

 import 'package:flutter/material.dart';
import 'package:solution_express/screens/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

     late AnimationController _controller;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String pseudo = "";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      'assets/image/logo.png',
                      height: 150,
                      width: 140,
                    ),
                   const Text(
                      "Connexion",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9A6ABB)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Nom d'utilisateur",
                          hintText: "Entrez votre Nom d'utilisateur",
                          icon: const Icon(
                            Icons.person,
                            color: Color(0xFF9A6ABB),
                            size: 20,
                          )),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Veillez entrez votre nom d'utilisateur";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) => pseudo = val!,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      autofocus: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: "Mot de passe",
                          hintText: "Entrez votre Mot de passe",
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       _obscureText =
                          //           !_obscureText; // Inverser l'état du texte masqué
                          //     });
                          //   },
                          //   icon: Icon(
                          //     _obscureText
                          //         ? Icons.visibility_off
                          //         : Icons
                          //             .visibility, // Choisir l'icône basée sur l'état du texte masqué
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          // icon:const Icon(
                          //   Icons.lock,
                          //   color: Color(0xFF9A6ABB),
                          //   size: 20,
                          // ),
                          ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Veillez entrez votre Mot de passe";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) => password = val!,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      autofocus: true,
                      obscureText: _obscureText,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text(
                        "Connexion",
                        style:  TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:const  Color(0xFF9A6ABB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: Size(300, 40)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   child: Text(
                    //     "Continuer avec Google",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    //   onPressed:(){} ,
                    //   style: ElevatedButton.styleFrom(
                    //       backgroundColor: Color.fromARGB(255, 236, 133, 14),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(15)),
                    //       minimumSize: const Size(300, 40)),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                   const  Text("si vous n'avez pas de compte ?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Register()));
                        },
                        child: const Text(
                          "inscrivez vous",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        ),
                  ],
                ),
                ),
                ),
      ),
    );
  }
}