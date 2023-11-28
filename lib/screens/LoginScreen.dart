
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/GuideScreen.dart';
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

    TextEditingController emailController = TextEditingController();
  TextEditingController motDePasseController = TextEditingController();

    Future<void> loginUser() async {
    // /utilisateur/login
    final String baseUrl = 'http://10.0.2.2:8080/user'; // Remplacez par la base URL de votre API.
    // final String baseUrl = 'https://buget-service-api-git.onrender.com/utilisateur'; // Remplacez par la base URL de votre API.
    final String email = emailController.text;
    final String password = motDePasseController.text;
    // UtilisateurProvider utilisateurProvider = Provider.of<UtilisateurProvider>(context, listen: false);

    if (email.isEmpty || password.isEmpty) {

      // Gérez le cas où l'email ou le mot de passe est vide.
       const String errorMessage = "Veillez remplir tout les champs ";
        // Gérez le cas où l'email ou le mot de passe est vide.
        showDialog(
          context:  context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(child: Text('Erreur')),
              content:const  Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:const  Text('OK'),
                ),
              ],
            );
          },
        );
      return;
    }
    const String endpoint = '/login';
    final Uri apiUrl = Uri.parse('$baseUrl$endpoint?email=$email&motDePasse=$password');

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Authentification réussie, vous pouvez gérer la réponse ici.
        // Par exemple, vous pouvez enregistrer le token d'authentification.
        final responseBody = json.decode(utf8.decode(response.bodyBytes));
        //final authToken = responseBody['authToken']; // Remplacez par le nom réel du champ d'authentification.
        // Enregistrez authToken ou effectuez d'autres actions nécessaires.
        emailController.clear();
        motDePasseController.clear();
        // Redirigez l'utilisateur vers la page suivante.
        // Créez un objet Utilisateur avec les informations nécessaires.
        Utilisateur utilisateur = Utilisateur(
          nom: responseBody['nom'], // Remplacez par les vrais noms de champs.
          prenom: responseBody['prenom'],
          image: responseBody['image'],
          motDePasse: password,
          email: email,
          idUtilisateur: responseBody['idUtilisateur'],
          // Autres champs...
        );
        // Créez une instance de la classe Utilisateur avec ces données.
        // final utilisateurConnecte = utilisateur;
        // Affichez les informations de l'utilisateur dans votre interface utilisateur (UI).
        // Stockez l'utilisateur dans UtilisateurProvider.
        // utilisateurProvider.setUtilisateur(utilisateur);
        Navigator.push(context,MaterialPageRoute(builder: (context) => Nav()));
        // Navigator.pushNamed(
        //   context,
        //   '/BottomNavigationPage',
        //   arguments: utilisateurConnecte, // Passer l'objet utilisateurConnecte en tant qu'argument.
        // );
      } else {
        // Gérez les erreurs d'authentification ici, par exemple affichez un message d'erreur.
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message']; // Remplacez par le nom réel du champ d'erreur.
        // Affichez un message d'erreur à l'utilisateur.
         showDialog(
          context:  context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:  Center(child: Text('Connexion echouer !')),
              content:  Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:  Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Gérez les erreurs liées à la requête HTTP ici.
      print('Erreur de connexion: $e');
      // Affichez un message d'erreur générique ou effectuez d'autres actions nécessaires.
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialisation des contrôleurs de texte avec des valeurs vides.
    emailController.clear();
    motDePasseController.clear();
  }
   


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
        body: Container(
          height: double.infinity,
           decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF4EEF9), // Couleur en haut
            Color.fromARGB(255, 203, 197, 206), // Couleur en haut
            Color.fromARGB(255, 187, 186, 192), // Couleur au milieu
            Color.fromARGB(255, 204, 203, 207), // Couleur en bas
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
                    controller: emailController,
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
                    controller: motDePasseController,
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
                    onPressed: 
                      loginUser,
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