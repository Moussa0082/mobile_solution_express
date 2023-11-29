
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/UpdateProfilScreen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {

  late Utilisateur utilisateur;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      utilisateur = Provider.of<UtilisateurProvider>(context, listen: false).utilisateur!;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: Container(
          
          child: Consumer<UtilisateurProvider>(
                builder: (context, utilisateurProvider, child) {
                  final utilisateur = utilisateurProvider.utilisateur;
           return  Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Image.asset('assets/image/bane.png'),
                 Container(height: 120,
                 width: 120,
                   child: CircleAvatar(
                    
                               radius: 30,
                               backgroundColor: const Color(0xFF9A6ABB),
                               child: 
                               SizedBox.fromSize(
                                 size: const Size.fromRadius(60),
                                 child: ClipOval(
                                   child:  utilisateur?.image == null ||
                                            utilisateur?.image?.isEmpty == true
                                        ? CircleAvatar(
                                          
                                            backgroundColor:  Color(0xFF9A6ABB),
                                            radius: 30,
                                            child: Text(
                                              "${utilisateur!.prenom.substring(0, 1).toUpperCase()}${utilisateur.nom.substring(0, 1).toUpperCase()}",
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 2),
                                            ),
                                          ) : CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                utilisateur!.image!),
                                            radius: 30,
                                  ),
                              ),
                           ),
                      ),
                 ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 40,),
                     
                      const Text('Nom   :', 
                      style: TextStyle( color: Color(0xFF9A6ABB),fontWeight:FontWeight.w600, fontSize: 20, ),),
                      const SizedBox(height: 5,width: 40,),
                      Expanded(child:  
                      Text(
                        "${utilisateurProvider.utilisateur!.nom.toUpperCase()}", 
                      style: TextStyle( color: Color(0xFF9A6ABB),fontSize: 20,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ),
                // Email 
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 40,),
                      const Text('Prenom   :', 
                      style: TextStyle(color: Color(0xFF9A6ABB),fontWeight:FontWeight.w600, fontSize: 20, ),),
                      const SizedBox(height: 5,width: 40,),
                      Expanded(child: 
                       Text("${utilisateurProvider.utilisateur!.prenom.toUpperCase()}",
                       style: TextStyle(color: Color(0xFF9A6ABB),fontSize: 20,fontWeight: FontWeight.bold),)),
                     
                    ],
                  ),
                ),
                    
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    
                    children: [
                      const SizedBox(width: 40,),
                      const Text( 'Email   :', 
                      style: TextStyle(color: Color(0xFF9A6ABB), fontWeight:FontWeight.w600, fontSize: 20, ),),
                      const SizedBox(height: 5,width: 40,),
                      Expanded(child: 
                       Text("${utilisateurProvider.utilisateur!.email}",
                       style: TextStyle(color: Color(0xFF9A6ABB),fontSize: 20,fontWeight: FontWeight.bold),)),
                    
                     
                    ],
                  ),
                ),
                const SizedBox(height:10 ,),
                    ElevatedButton(
                        child: Text(
                          "Deconnexion",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: 
                          (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9A6ABB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            minimumSize: Size(300, 40)),
                      ),
                    
              ],
            );
           }
          ),
        
        ),
      ),
    );
  }
}


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
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Nav()));
        }, icon: const Icon(Icons.arrow_back), iconSize: 30,color: Color(0xFF9A6ABB),),
        
        const SizedBox(width: 120,),
        const Text(
          'Profil',
          style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 120,),
                 IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfilScreen()));
                 }, icon: Icon(Icons.edit), iconSize: 25, color: Color(0xFF9A6ABB),),
            ],
          ),
         ),
        
       );
        
  }
 }