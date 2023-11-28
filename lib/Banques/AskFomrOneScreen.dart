
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_express/Banques/AskFormEnd.dart';
  enum SingingCharacter { masculin, feminin }

class AskFormOneScreen extends StatefulWidget {
  const AskFormOneScreen({super.key});

  @override
  State<AskFormOneScreen> createState() => _AskFormOneScreenState();
}

class _AskFormOneScreenState extends State<AskFormOneScreen> {

   File? image;
  String? imageSrc;



 

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
    TextEditingController datenaiss = TextEditingController();
  final reponseController = TextEditingController();
  //radio
    SingingCharacter? _character = SingingCharacter.masculin;
    // radio var 
  List<String> type = [];
  List<String> choix = [];
  @override
  void initState() {
    
    super.initState();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Compte courant', style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 20),) ,
        centerTitle: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: SingleChildScrollView(
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
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Column(
                          
                          children: [

                            const SizedBox(height:10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start, 
                              children: [
                                // label 

                                Positioned(
                                  
                                  child: Text('Votre adresse', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Adresse",
                        hintText: "Entrez votre adresse",
                       ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre adresse";
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
                                  
                                  child: Text('Votre date de naissance', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                                  controller:datenaiss,
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
                                            datenaiss.text =
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
                        labelText: "Date de naisance",
                        hintText: "Entrez votre date de naissance",
                       ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre date de naissance";
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
                                  
                                  child: Text('Votre numéro de telephone', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Téléphone",
                        hintText: "Entrez votre numero de telephone",
                       ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre numéro de telephone";
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => email = val!,
                  ),
                //  fin textform field 

                  //radio button
                         SizedBox(height: 10,),
                     
                                Positioned(child: const Text("Votre sexe ",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFF9A6ABB)),)),
                              ],
                            ),

                            SizedBox(
                              height: 5,
                            ),
   
                  
                            Row(

                              children: [
                                // const SizedBox(width: 10,),
                                // Text("Masculin", style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15, color: Color(0xFF9A6ABB)),),
                                // const SizedBox(width: 10,),
                                // Radio(value: (){}, groupValue: null, onChanged: null),
                                // const SizedBox(width: 120,),
                                // Text("Feminin", style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15, color: Color(0xFF9A6ABB)),),
                                // const SizedBox(width: 10,),
                                // Radio(value: (){}, groupValue: null, onChanged: null),
                                 Radio<SingingCharacter>(
                            value: SingingCharacter.masculin,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          const Text('Masculin' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB),),),
                          const SizedBox(width:100),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.feminin,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          const Text('Féminin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)),),
                               
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:50.0),
                              child: ElevatedButton(
                                onPressed: () async {

                                  if (_formKey.currentState!.validate()) {
                                    debugPrint('Début validation ');
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const AskFormEnd() ));
                                    
                              
                                   
                              
                                    // Question question = Question(
                                    //   questionId: null,
                                    //   point: 50,
                                    //   text: textController.text,
                                    //   type: type.first,
                                    //   rank: 1,
                                    //   rankResponse: 1,
                                    //   choises:
                                    //       choisesList, // Utilisez la liste de Choise créée précédemment
                                    // );
                              
                                    // // Vous pouvez ensuite ajouter cette question à votre base de données, par exemple, en utilisant votre service QuestionService.
                                    // QuestionService Q_service = QuestionService();
                                    // Question? q = await Q_service.createQuestion(
                                    //     1, 1, question);
                                    // if (q != null) {
                                    //   // L'insertion a réussi, redirigez vers la page SuccessPage
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const SuccessPage(),
                                    //     ),
                                    //   );
                                    // } else {
                                    //   // L'insertion a échoué, affichez un message d'erreur ou effectuez une autre action
                                    //   // Vous pouvez également ajouter un traitement spécifique en cas d'échec ici
                                    // }
                              
                                    // Affichez les informations de la question et de ses choix
                                    // debugPrint(question.toJson().toString());
                              
                                    // ChoixService choixService = ChoixService();
                                    // await choixService.createChoix(1, 1, 1, choises);
                              
                                    print("Demande envoyer avec succès");
                                  } else {
                                    print("Demande non envoyer");
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
            ),
          ],
        ),
      ),
    );
  }
}







/* 
Future<void> _showImageSourceDialog() async {
  final BuildContext context = this.context; // Get the BuildContext from the current widget

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choisir une source'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                // Demander l'autorisation d'accéder à la caméra
                // if (PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.camera)) {
                //   // L'utilisateur n'a pas encore été invité à accorder l'autorisation
                //   // Demander l'autorisation
                //   PermissionHandler().requestPermissions([PermissionGroup.camera]).then((permissions) {
                //     if (permissions[PermissionGroup.camera] == PermissionStatus.granted) {
                //       // L'autorisation a été accordée
                //       _pickImage(ImageSource.camera);
                //     } else {
                //       // L'autorisation a été refusée
                //       // Afficher un message d'erreur à l'utilisateur
                //       // Afficher un message dans un Toast
                //       Fluttertoast.showToast(
                //         msg: "L'autorisation d'accéder à la caméra a été refusée",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.CENTER,
                //         backgroundColor: Colors.red,
                //         textColor: Colors.white,
                //       );
                //     }
                //   });
                // } else {
                  // L'utilisateur a déjà été invité à accorder l'autorisation
                  // Prendre une photo sans demander l'autorisation
                  _pickImage(ImageSource.camera);
                // }
              },
              child: Column(
                children: [
                  Icon(Icons.camera_alt, size: 40),
                  Text('Prendre une photo'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Demander l'autorisation d'accéder à la galerie
                // if (PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.photos)) {
                //   // L'utilisateur n'a pas encore été invité à accorder l'autorisation
                //   // Demander l'autorisation
                //   PermissionHandler().requestPermissions([PermissionGroup.photos]).then((permissions) {
                //     if (permissions[PermissionGroup.photos] == PermissionStatus.granted) {
                //       // L'autorisation a été accordée
                //       _pickImage(ImageSource.gallery);
                //     } else {
                //       // L'autorisation a été refusée
                //       // Afficher un message d'erreur à l'utilisateur
                //       // Afficher un message dans un Toast
                //       Fluttertoast.showToast(
                //         msg: "L'autorisation d'accéder à la galerie a été refusée",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.CENTER,
                //         backgroundColor: Colors.red,
                //         textColor: Colors.white,
                //       );
                //     }
                //   });
                // } else {
                  // L'utilisateur a déjà été invité à accorder l'autorisation
                  // Prendre une photo sans demander l'autorisation
                  _pickImage(ImageSource.gallery);
                // }
              },
              child: Column(
                children: [
                  Icon(Icons.image, size: 40),
                  Text('Choisir depuis la galerie'),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}


*/