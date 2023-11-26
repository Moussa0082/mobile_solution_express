

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
    return  Scaffold(
      // backgroundColor:
      // LinearGradient(
      //   Colors = [
           
      //   ],
      //   begin = Alignment.topCenter,
      //   end = Alignment.bottomCenter,
      //   transform = GradientRotation(math.pi / 3),
      // ),
        body: Container(
          height: double.infinity,
           decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF4EEF9), // Couleur en haut
            Color.fromARGB(255, 239, 235, 241), // Couleur en haut
            Color.fromARGB(255, 212, 210, 221), // Couleur au milieu
            Color.fromARGB(255, 226, 223, 236), // Couleur en bas
          ],
        ),
      ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                          height: 50,
                        ),
                  Image.asset(
                    'assets/image/logo.png',
                    // height: 200,
                    // width: 140,
                  ),
                  const SizedBox(
                          height: 50,
                        ),
                  const Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9A6ABB)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Email",
                        hintText: "Entrez votre email",
                        icon: const Icon(
                          Icons.mail,
                          color: Color(0xFF9A6ABB),
                          size: 20,
                        )),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre email";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => email = val!,
                  ),
                  // fin  adresse email
                  const SizedBox(
                    height: 10,
                  ),
                  // debut  mot de pass
                  TextFormField(
                    // controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Mot de passe",
                        hintText: "Entrez votre mot de passe",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Inverser l'état du texte masqué
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons
                                    .visibility, // Choisir l'icône basée sur l'état du texte masqué
                            color: Colors.grey,
                          ),
                        ),
                        icon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF9A6ABB),
                          size: 20,
                        )),
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre  mot de passe";
                      }
                      if (val.length < 4) {
                        return 'Le mot de passe doit contenir au moins 4 caractères';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => password = val!,
                  ),
                  // fin mot de pass
                  const SizedBox(
                    height: 10,
                  ),
                
                  // fin confirme mot de passe
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9A6ABB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minimumSize: Size(300, 40)),
                  ),
                  const SizedBox(
                        height: 60,
                      ),
                       const Text("si vous n'avez pas de compte ?", style: TextStyle(fontSize: 20),),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>   RegisterScreen()));
                          },
                          child: const Text(
                            "Inscrivez vous",
                            style: TextStyle(
                              fontSize: 20,
                                color: Colors.blue,
                                // decoration: TextDecoration.underline
                                ),
                          )
                          )
                ],
              ),
              ),
              ),
          ),
        ),
        );
  }
}