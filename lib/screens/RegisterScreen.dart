import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/LoginScreen.dart';
import 'package:solution_express/services/UtilisateurService.dart';

class RegisterScreen extends StatefulWidget {
  // const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
   TextEditingController nom_controller = TextEditingController();
  TextEditingController prenom_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  // TextEditingController motDepasse_controller = TextEditingController();
  // TextEditingController RepmotDePasse_controller = TextEditingController(); 

  String value = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String pseudo = "";
  String password = "";
  String passwordConfirm = "";
  bool _obscureText = true;

  String? imageSrc;
  File? images;

   

   
   Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

   Future<File?> getImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return null;

  return File(image.path);
}



  Future<void> _pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        this.images = imagePermanent;
     
        imageSrc = imagePermanent.path; // Notez l'utilisation de "?"
      });
    } else {
      // L'utilisateur a annulé la sélection d'image.
      return;
    }
  } on PlatformException catch (e) {
    debugPrint('erreur : $e');
  }
}

  @override
  void initState() {
    super.initState();
    nom_controller.clear();
    prenom_controller.clear();
    email_controller.clear();
    passwordController.clear();
    passwordConfirmController.clear();
  }

  Future<void> _ajouterUtilisateur() async {
    final image = images;
    final nom = nom_controller.text;
    final prenom = prenom_controller.text;
    final email = email_controller.text;
    final motDePasse = passwordController.text;

    if (nom.isEmpty || prenom.isEmpty || email.isEmpty || motDePasse.isEmpty) {
      // Gérez le cas où l'email ou le mot de passe est vide.
      const String errorMessage = "Veuillez remplir tous les champs";
      debugPrint(errorMessage);
      return;
    }

    Utilisateur nouveauUtilisateur;

    try {
      if(image != null){
        nouveauUtilisateur = await UtilisateurService.ajouterUtilisateur(
          nom: nom,
          prenom: prenom,
          email: email,
          motDePasse: motDePasse, image: images as File);
      }else{
        nouveauUtilisateur = await UtilisateurService.ajouterUtilisateur(
          nom: nom,
          prenom: prenom,
          email: email,
          motDePasse: motDePasse

        );
      }

      nouveauUtilisateur;
      // Le nouvel utilisateur a été ajouté avec succès, vous pouvez gérer la réponse ici.
      print('Utilisateur ajouté avec succès : ${nouveauUtilisateur.nom}');
      nom_controller.clear();
      prenom_controller.clear();
      email_controller.clear();
      passwordController.clear();
      passwordConfirmController.clear();

    } catch (e) {
      // Une erreur s'est produite lors de l'ajout de l'utilisateur, vous pouvez gérer l'erreur ici.
      final String errorMessage = e.toString();
      debugPrint(errorMessage);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      // backgroundColor:
      // LinearGradient(
      //   Colors = [
           
      //   ],
      //   begin = Alignment.topCenter,
      //   end = Alignment.bottomCenter,
      //   transform = GradientRotation(math.pi / 3),
      // ),
        body: Container(
           decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF4EEF9), // Couleur en haut
            Color.fromARGB(255, 239, 235, 241), // Couleur en haut
            Color.fromARGB(255, 212, 210, 221), // Couleur au milieu
            Color.fromARGB(255, 220, 216, 233), // Couleur en bas
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
                    "Inscription",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9A6ABB)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 20, color: Color(0xFF9A6ABB)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: prenom_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Prenom",
                        hintText: "Entrez votre prenom",
                        icon: const Icon(
                          Icons.person,
                          color: Color(0xFF9A6ABB),
                          size: 20,
                        )),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre prenom";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => firstName = val!,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nom_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            
                            ),
                        labelText: "Nom",
                        hintText: "Entrez votre nom",
                        icon: const Icon(
                          Icons.person,
                          color: Color(0xFF9A6ABB),
                          size: 20,
                        )),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre nom";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => lastName = val!,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15)),
                  //       labelText: "Pseudo",
                  //       hintText: "Entrez votre pseudo",
                  //       icon: const Icon(
                  //         Icons.person,
                  //         color: Color(0xFF9A6ABB),
                  //         size: 20,
                  //       )),
                  //   validator: (val) {
                  //     if (val == null || val.isEmpty) {
                  //       return "Veillez entrez votre pseudo";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   onSaved: (val) => pseudo = val!,
                  //   keyboardType: TextInputType.text,
                  //   autocorrect: true,
                  //   autofocus: true,
                  //   // onChanged: affichage,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: email_controller,
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
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Nouveau mot de passe",
                        hintText: "Entrez votre nouveau mot de passe",
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
                        return "Veillez entrez votre nouveau mot de passe";
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
                  TextFormField(
                    controller: passwordConfirmController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Confirmer mot de passe",
                        hintText: "Confirmer mot de passe",
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
                          Icons.lock,
                          color: Color(0xFF9A6ABB),
                          size: 20,
                        )),
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez confirmer votre mot de passe";
                      }
                      if (val != passwordController.text) {
                        return "les mots de passe ne correspondent pas";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) => passwordConfirm = val!,
                  ),
                  // fin confirme mot de passe
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Inscription",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async{
                        
                    final nom = nom_controller.text;
                    final prenom = prenom_controller.text;
                    final email = email_controller.text;
                    final motDePasse = passwordController.text;

                    if (nom.isEmpty || prenom.isEmpty || email.isEmpty || motDePasse.isEmpty) {
                      // Gérez le cas où l'email ou le mot de passe est vide.
                      const String errorMessage = "Veuillez remplir tous les champs";
                      debugPrint(errorMessage);
                      return;
                    }

                    Utilisateur nouveauUtilisateur;

                    try  {
                      if(images != null){
                        nouveauUtilisateur = await UtilisateurService.ajouterUtilisateur(
                            nom: nom,
                            prenom: prenom,
                            email: email,
                            motDePasse: motDePasse, image: images as File);
                      }else{
                        nouveauUtilisateur = await UtilisateurService.ajouterUtilisateur(
                            nom: nom,
                            prenom: prenom,
                            email: email,
                            motDePasse: motDePasse

                        );
                      }

                      // Provider.of<UtilisateurProvider>(context, listen: false).setUtilisateur(nouveauUtilisateur);
                      // Le nouvel utilisateur a été ajouté avec succès, vous pouvez gérer la réponse ici.
                      print('Utilisateur ajouté avec succès : ${nouveauUtilisateur.nom}');
                      nom_controller.clear();
                      prenom_controller.clear();
                      email_controller.clear();
                      passwordController.clear();
                      passwordConfirmController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                    } catch (e) {
                      // Une erreur s'est produite lors de l'ajout de l'utilisateur, vous pouvez gérer l'erreur ici.
                      final String errorMessage = e.toString();
                      debugPrint(errorMessage);

                    }
                  
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9A6ABB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minimumSize: Size(300, 40)),
                  ),
                  const SizedBox(
                        height: 20,
                      ),
                       const Text("si vous avez deja un compte ?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  const LoginScreen()));
                          },
                          child: const Text(
                            "connecter vous",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                // decoration: TextDecoration.underline
                                ),
                          )
                          )
                ],
              )),
              ),
          ),
        ));
  }
}