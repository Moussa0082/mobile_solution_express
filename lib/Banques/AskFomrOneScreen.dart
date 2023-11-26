
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_express/Banques/AskFormEnd.dart';

class AskFormOneScreen extends StatefulWidget {
  const AskFormOneScreen({super.key});

  @override
  State<AskFormOneScreen> createState() => _AskFormOneScreenState();
}

class _AskFormOneScreenState extends State<AskFormOneScreen> {

   File? image;
  String? imageSrc;

  final _reponseController = TextEditingController();
  List<TextEditingController> _reponseControllers = [];

  bool isAddingResponse = false;
  int _textFieldCount = 0;

  void generateTextField() {
    if (_textFieldCount < 5) {
      setState(() {
        _textFieldCount++;
        _reponseControllers
            .add(TextEditingController()); // Ajoutez un nouveau contrôleur
      });
    }
  }

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
  final reponseController = TextEditingController();
  List<String> type = [];
  List<String> choix = [];
  @override
  void initState() {
    
    _reponseControllers = [];
    super.initState();
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
                            'Ajouter une image',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          buildButton(
                            title: 'Choisir image',
                            icon: Icons.image,
                            onClicked: () => pickImages(),
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
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [

                            const SizedBox(height:10),
                            Column(
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
                                // label 
                                Positioned(
                                  
                                  child: Text('Votre date de naissance', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9A6ABB), fontSize: 20),),
                                ),

                                //Text form field 
                                 TextFormField(
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

                 

                              ],
                            ),

                            SizedBox(
                              height: 15,
                            ),
   
                  //radio button
                   SizedBox(height: 5,),
                            const Text("Votre sexe ",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFF9A6ABB)),),
                            Row(
                              children: [
                                const SizedBox(width: 10,),
                                Text("Masculin", style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15, color: Color(0xFF9A6ABB)),),
                                const SizedBox(width: 10,),
                                Radio(value: (){}, groupValue: null, onChanged: null),
                                const SizedBox(width: 120,),
                                Text("Feminin", style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15, color: Color(0xFF9A6ABB)),),
                                const SizedBox(width: 10,),
                                Radio(value: (){}, groupValue: null, onChanged: null),
                              
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

class ChoixPage extends StatefulWidget {
  const ChoixPage({super.key});

  @override
  State<ChoixPage> createState() => _ChoixPageState();
}

class _ChoixPageState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix page'),
      ),
    );
  }
}

