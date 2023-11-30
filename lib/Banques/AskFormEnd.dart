
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:solution_express/Banques/BankAskStateScreen.dart';
import 'package:solution_express/models/Demande.dart';

    enum SingingCharacter {Celibataire, Marier }

  enum SingingCharacters { Etranger, Resident_Permanent }


class AskFormEnd extends StatefulWidget {
  late Demande demande;
   AskFormEnd({super.key, required this.demande});

  @override
  State<AskFormEnd> createState() => _AskFormEndState();
}

class _AskFormEndState extends State<AskFormEnd> {

    File? image;
  String? imageSrc;

  final _reponseController = TextEditingController();
  List<TextEditingController> _reponseControllers = [];

      SingingCharacter? _character = SingingCharacter.Celibataire;
      SingingCharacters? _characters = SingingCharacters.Resident_Permanent;


  bool isAddingResponse = false;
  int _textFieldCount = 0;

  

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

  final _formKey = GlobalKey<FormState>();
  final lieuNaissController = TextEditingController();
  final nationnaliteController = TextEditingController();
  final reponseController = TextEditingController();
  List<String> type = [];
  List<String> choix = [];
  @override
  void initState() {
    
    super.initState();
    print(widget.demande);
  }
  List<String> visibilite = [];

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
                            "Carte d'identité/Bio/Passport",
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
                                  
                                  child: Text('Votre lieu de naissance', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                                  controller:lieuNaissController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Lieu de naissance",
                        hintText: "Entrez votre lieu de naissance",
                       ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre lieu de naissance";
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
                                  
                                  child: Text('Votre nationnalité', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
                          controller:nationnaliteController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                           borderSide: BorderSide(
                          color: Color(0xFF9A6ABB),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Nationnalité",
                        hintText: "Entrez votre nationnalité",
                       ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Veillez entrez votre nationnalité";
                      } else {
                        return null;
                      }
                    },
                    // onSaved: (val) => email = val!,
                  ),
                //  fin textform field 
                const SizedBox(height:10),
                                // label 
                              

                  //radio button
                         SizedBox(height: 10,),
                     
                                Positioned(child: const Text("Votre statut de residence ",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFF9A6ABB)),)),
                              ],
                            ),

                            Row(

                              children: [
                                
                                 Radio<SingingCharacter>(
                            value: SingingCharacter.Celibataire,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          const Text('Celibataire' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB),),),
                          const SizedBox(width:100),
                          Radio<SingingCharacter>(
                            value: SingingCharacter.Marier,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          Expanded(child: const Text('Marier', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)),)),
                               
                              ],
                            ),
                             SizedBox(height: 10,),
                          Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                            children:[

                                const Text("Votre statut de residence ",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFF9A6ABB)),),
                            ],
                          ),

                              
                            
                            Row(

                              children: [
                                
                                 Radio<SingingCharacters>(
                            value: SingingCharacters.Etranger,
                            groupValue: _characters,
                            onChanged: (SingingCharacters? value) {
                              setState(() {
                                _characters = value;
                              });
                            },
                          ),
                          const Text('Etranger' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB),),),
                          const SizedBox(width:70),
                          Radio<SingingCharacters>(
                            value: SingingCharacters.Resident_Permanent,
                            groupValue: _characters,
                            onChanged: (SingingCharacters? value) {
                              setState(() {
                                _characters = value;
                              });
                            },
                          ),
                          Expanded(child: const Text('Resident Permanent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)),)),
                               
                              ],
                            ),


                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:50.0),
                              child: ElevatedButton(
                                onPressed: () async {

                                  if (_formKey.currentState!.validate()) {
                                    debugPrint('Début validation ');
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const BankAskStateScreen() ));
                                    
                              
                                   
                              
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
                                child: Text('Envoyer la demande', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB)), ),
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