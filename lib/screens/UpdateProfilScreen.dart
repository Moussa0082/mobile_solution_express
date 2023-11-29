

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';
import 'package:solution_express/screens/ProfilScreen.dart';
import 'package:solution_express/services/UtilisateurService.dart';




class UpdateProfilScreen extends StatefulWidget {
  const UpdateProfilScreen({super.key});

  @override
  State<UpdateProfilScreen> createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {

  TextEditingController nom_controller = TextEditingController();
  TextEditingController prenom_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  String? imageSrc;
  File? image;
  
  late Utilisateur utilisateur;

   
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

Future<void> _pickImage(ImageSource source) async {
  final image = await getImage(source);
  if (image != null) {
    setState(() {
      this.image = image;
      imageSrc = image.path;
    });
  }
}

  Future pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // final ImageTemporary = File(images.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
        imageSrc = imagePermanent.path;
      });
    } on PlatformException catch (e) {
      print('Impossible de télécharger l\'image $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  //radio

    Future<void> _updateUtilisateur() async {
    final utilisateurId = utilisateur.idUtilisateur;
    final nom = nom_controller.text;
    final prenom = prenom_controller.text;
    final email = email_controller.text;
  BuildContext context = (this.context);
    if (nom.isEmpty || prenom.isEmpty || email.isEmpty) {
      // Gérez le cas où l'email ou le mot de passe est vide.
      const String errorMessage = "Veuillez remplir tous les champs";
      debugPrint(errorMessage);
      return;
    }

    Utilisateur utilisateurMaj;

    try {
      if (image != null) {
        utilisateurMaj = await Provider.of<UtilisateurService>((this.context), listen: false).updateUtilisateur(
          idUtilisateur: utilisateur.idUtilisateur,
          nom: nom,
          prenom: prenom,
          email: email,
          image: image as File,
        );
        Provider.of<UtilisateurProvider>((this.context), listen: false).setUtilisateur(utilisateurMaj);
      } else {
        utilisateurMaj = await Provider.of<UtilisateurService>(context, listen: false).updateUtilisateur(
          idUtilisateur: utilisateur.idUtilisateur,
          nom: nom,
          prenom: prenom,
          email: email
        );
        Provider.of<UtilisateurProvider>((this.context), listen: false).setUtilisateur(utilisateurMaj);
      }
      // showDialog(
      //   context: context, 
      // builder: (BuildContext context){
      //   return AlertDialog(
      //     title: const Center(
      //       child:  Text('Succèss'),
      //     ),
      //     content: Text('Profil modifier avec succèss'),
      //     actions: <Widget>[
      //      TextButton(
      //        onPressed:() {
      //        Navigator.of(
      //        context).pop();},
      //         child:
      //          const Text(
      //           'Ok'),
      //        )
      //       ],                                                     
      //   );
      // }
      // );
      // Le profil utilisateur a été mis à jour avec succès, vous pouvez gérer la réponse ici.
      Navigator.pop(context);
      print(
          'Profil utilisateur mis à jour avec succès : ${utilisateurMaj.nom}');
      // Vous pouvez également gérer la navigation vers une autre page après la mise à jour.
    } catch (e) {
      // Une erreur s'est produite lors de la mise à jour du profil utilisateur, vous pouvez gérer l'erreur ici.
      final String errorMessage = e.toString();
      debugPrint(errorMessage);
    }
  }
  
 
  List<String> visibilite = [];

  Future<void> _showImageSourceDialog() async {
  final BuildContext context = this.context;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 150,
        child: AlertDialog(
          title: Text('Choisir une source'),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Fermer le dialogue
                  _pickImage(ImageSource.camera);
                },
                child: Column(
                  children: [
                    Icon(Icons.camera_alt, size: 40),
                    Text('Camera'),
                  ],
                ),
              ),
              const SizedBox(width:40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Fermer le dialogue
                  _pickImage(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    Icon(Icons.image, size: 40),
                    Text('Galerie photo'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

   @override
  void initState() {
    
    super.initState();
    utilisateur = Provider.of<UtilisateurProvider>((this.context), listen: false).utilisateur!;
     nom_controller.text = utilisateur.nom;
    prenom_controller.text = utilisateur.prenom;
    email_controller.text = utilisateur.email;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(

            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                
                margin: EdgeInsets.symmetric(horizontal: 100),
                child:
                  utilisateur.image == null ||
                                      utilisateur.image!.isEmpty
                                  ? CircleAvatar(
                                      //backgroundImage: AssetImage("assets/images/avatar.png"),
                                      //  child: Image.network(utilisateur.photos),
                                      backgroundColor:
                                          const Color(0xFF9A6ABB),
                                      radius: 30,
                                      child: Text(
                                        "${utilisateur.prenom.substring(0, 1).toUpperCase()}${utilisateur.nom.substring(0, 1).toUpperCase()}",
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 2),
                                      ),
                                    )
                                  : 
                                  // CircleAvatar(
                                  //     backgroundImage:
                                  //         NetworkImage(utilisateur.image!),
                                  //     radius: 30),
                 Stack(
                alignment: Alignment.bottomRight,
                  children: [
                    const SizedBox(width: 20,),
                  Positioned(child:
                 (image != null)
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/image/bane.png') ,
                  //  Image.asset('assets/image/bane.png')
                   ),
                         CircleAvatar(
                                backgroundColor: Color (0xFF9A6ABB),
                                child:  IconButton(onPressed: () async {
                                 await _showImageSourceDialog();
                                }, icon: Icon(Icons.camera_alt_outlined),iconSize: 30 ,color: (Colors.white),)),
                ]
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Positioned(
                                  
                                  child: Text('Votre nom', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                                  controller: nom_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Nom",
                        hintText: "Entrez votre nom",
                       ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre nom";
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => email = val!,
                  ),
                //  fin textform field 
                  ],
                ),
              ),
              // Email 
              // const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                        Positioned(
                                  
                                  child: Text('Votre prenom', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                                  controller: prenom_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Prenom",
                        hintText: "Entrez votre prenom",
                       ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre prenom";
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => email = val!,
                  ),
                //  fin textform field 
                   
                  ],
                ),
              ),
        
              // const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Positioned(
                                  
                                  child: Text('Votre adresse email', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 

                                 TextFormField(
                                  controller: email_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Email",
                        hintText: "Entrez votre email",
                       ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre adresse email";
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => email = val!,
                  ),
                //  fin textform field 
                   
                  ],
                ),
              ),
              const SizedBox(height:10 ,),
        ElevatedButton(
                      child: Text(
                        "Modifier",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: 
                        _updateUtilisateur,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9A6ABB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: Size(300, 40)),
                    ),
                    //Annuler mod
              const SizedBox(height:10 ,),
        ElevatedButton(
                      child: Text(
                        "Annuler",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (Colors.red),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: Size(300, 40)),
                    ),
            ],
          ),
        
        ),
      ),
    );
  }
}


//app bar 


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 70,
              child:Container(
          padding: EdgeInsets.only(top:15 ), // Ajoutez du padding si nécessaire
          // margin: EdgeInsets.all(2), // Ajoutez des marges si nécessaire
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(8), // Ajoutez un rayon pour les coins
            border: Border.all(color: Colors.grey), // Ajoutez une bordure avec la couleur de votre choix
          ),
          child: Row(
            children: [
        const SizedBox(height: 15,),
        // const SizedBox(height: 160, width: 5,),
        
        const SizedBox(width: 120,),
        const Text(
          'Modifier Profil',
          style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
        ),
        
            ],
          ), 
         ),
        
       );
        
  }
 }