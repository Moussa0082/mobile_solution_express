

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_express/screens/ProfilScreen.dart';

class CreateGroupeScreen extends StatefulWidget {
  const CreateGroupeScreen({super.key});

  @override
  State<CreateGroupeScreen> createState() => _CreateGroupeScreenState();
}

class _CreateGroupeScreenState extends State<CreateGroupeScreen> {

     File? image;
  String? imageSrc;
//  late TypeBanque typeBanque;

   // Fonction pour créer un bouton
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton.icon(
      onPressed: onClicked,
      icon: Icon(icon),
      label: Text(title),
    );
  }

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
  final textController = TextEditingController();

    TextEditingController adresseController = TextEditingController();
    TextEditingController datenaissController = TextEditingController();
    TextEditingController numeroController = TextEditingController();

  final reponseController = TextEditingController();
  //radio
    // radio var 
  

  @override
  void initState() {
    
    super.initState();
    // adresseController.clear();
    // datenaissController.clear();
    // numeroController.clear();        
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Groupe damie", style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 20),) ,
        centerTitle: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                height: 200,
                width: double.infinity,
                child: (image != null)
                    ? Image.file(
                        image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        decoration:const BoxDecoration(
                            image: DecorationImage(
                          image:  AssetImage('assets/image/background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        ),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Photo d'identité",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            buildButton(
                              title: 'Choisir image',
                              icon: Icons.image,
                              onClicked: () => _showImageSourceDialog(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(20),
                  child: Column(children: <Widget>[
                    Column(
                        
                        children: [
                            
                          const SizedBox(height:10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start, 
                            children: [
                              // label 
                            
                              Positioned(
                                
                                child: Text('Nom du groupe', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                              ),
                            
                              //Text form field 
                               TextFormField(
                                controller:adresseController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                         borderSide: BorderSide(
                        color: Color(0xFF9A6ABB),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Nom du groupe",
                      hintText: "Entrez le nom du groupe",
                     ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Veillez entrez le nom du groupe";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (val) => email = val!,
                ),
                const SizedBox(height: 10,),
                              Positioned(
                                
                                child: Text('Prix Cotisation', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                              ),
                            
                              //Text form field 
                               TextFormField(
                                controller:adresseController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                         borderSide: BorderSide(
                        color: Color(0xFF9A6ABB),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Prix cotisation",
                      hintText: "Entrez le prix de la cotisation",
                     ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Veillez entrez le nom du groupe";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (val) => email = val!,
                ),

                       const SizedBox(height:10),
                              // label 
                              Positioned(
                                
                                child: Text('Description du groupe', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                              ),
                            
                              //Text form field 
                               TextFormField(
                                controller:numeroController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                         borderSide: BorderSide(
                        color: Color(0xFF9A6ABB),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Description",
                      hintText: "Entrez la description du groupe",
                     ),
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Veillez entrez la description du groupe";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (val) => email = val!,
                                      ),
                                    
                                    //  fin textform field 
                                    const SizedBox(height:10),
                              // label 
                              Positioned(
                                
                                child: Text('Date début', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                              ),
                            
                              //Text form field 
                               TextFormField(
                                controller:datenaissController,
                                onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(formattedDate);
                                        setState(() {
                                          datenaissController.text =
                                              formattedDate;
                                        });
                                      } else {}
                                    },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                         borderSide: BorderSide(
                        color: Color(0xFF9A6ABB),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Date début",
                      hintText: "Entrez la date de début",
                     ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Veillez entrez la date du début";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (val) => email = val!,
                  ),
                                    const SizedBox(height:10),
                              // label 
                              Positioned(
                                
                                child: Text('Date fin', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                              ),
                            
                              //Text form field 
                               TextFormField(
                                controller:datenaissController,
                                onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));
                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(formattedDate);
                                        setState(() {
                                          datenaissController.text =
                                              formattedDate;
                                        });
                                      } else {}
                                    },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                         borderSide: BorderSide(
                        color: Color(0xFF9A6ABB),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Date de fin",
                      hintText: "Entrez la date de fin",
                     ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Veillez entrez la date de fin";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (val) => email = val!,
                  ),
                                    //  fin textform field 
                            
                                      //radio button
                       SizedBox(height: 10,),
                            ],
                          ),
                            
                          SizedBox(
                            height: 5,
                          ),
                               
                                      
                         
                            
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:50.0),
                            child: ElevatedButton(
                              onPressed: ()  {
                            
                                
                            if(_formKey.currentState!.validate()){
                                  debugPrint('Début validation ' );
                           
                                
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfilScreen() ));
                               
                                  
                            
                                  print("Demande envoyer avec succès");
                              }
                              },
                              child: Text('Continuer', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)), ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(250,40),
                                backgroundColor:Color.fromARGB(255, 240, 237, 241) ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // padding: EdgeInsets.symmetric(
                                //   vertical: 20, // Espacement vertical
                                //   horizontal: 30, // Espacement horizontal
                                // ),
                              ),
                            ),
                          ),
                         
                        ]
                        ),
                  ]
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}