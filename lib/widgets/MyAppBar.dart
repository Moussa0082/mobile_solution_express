import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/providers/UtilisateurProvider.dart';

 class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);


  



  @override
  Widget build(BuildContext context) {
    return 
    // AppBar(
    //   leading: IconButton(
    //     icon: Icon(
    //       Icons.arrow_back,
    //       color: Colors.grey[800],
    //       size: 20,
    //     ),
    //     onPressed: null,
    //   ),
    //   centerTitle: true,
    //   title: Text(
    //     'Explore',
    //     style: GoogleFonts.nunito(
    //       color: Colors.black,
    //       fontSize: 22,
    //       fontWeight: FontWeight.w800,
    //     ),
    //   ),
    //   actions: [
    //     IconButton(
    //       icon: Icon(
    //         Icons.favorite_outline_rounded,
    //         color: Colors.grey[800],
    //         size: 20,
    //       ),
    //       onPressed: null,
    //     ),
    //     IconButton(
    //       icon: Icon(
    //         Icons.place,
    //         color: Colors.grey[800],
    //         size: 20,
    //       ),
    //       onPressed: null,
    //     ),
    //   ],
    //   backgroundColor: Colors.white,
    // );
      Container(
              height: 70,
              child:Container(
          // padding: EdgeInsets.all(1), // Ajoutez du padding si nécessaire
          // margin: EdgeInsets.all(2), // Ajoutez des marges si nécessaire
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(8), // Ajoutez un rayon pour les coins
            border: Border.all(color: Colors.grey), // Ajoutez une bordure avec la couleur de votre choix
          ),
          child: Row(
            children: [
        const SizedBox(height: 130, width: 5,),
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF9A6ABB),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(60),
            child: ClipOval(
              child: Image.asset(
                'assets/image/me.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        const Text(
          'Moussa Bane',
          style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 90,),
        CircleAvatar(
          radius: 30,
          backgroundColor:const Color(0xFF9A6ABB),
          child: SizedBox.fromSize(
            child:const  ClipOval(
              child: Icon(Icons.notifications, size: 40,color: Colors.white,),
            ),
          ),
        )
            ],
          ),
         ),
        
       );
        
  }
 }



 class MyAppBare extends StatefulWidget implements PreferredSizeWidget{
  const MyAppBare({super.key});
  Size get preferredSize => new Size.fromHeight(50);

  @override
  State<MyAppBare> createState() => _MyAppBareState();
}

class _MyAppBareState extends State<MyAppBare> {

    late Future<Map<String, dynamic>> future;
  late Utilisateur utilisateur;

   @override
  void initState() {
    super.initState();
    utilisateur =
        Provider.of<UtilisateurProvider>(context, listen: false).utilisateur!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 70,
              child:Container(
          // padding: EdgeInsets.all(1), // Ajoutez du padding si nécessaire
          // margin: EdgeInsets.all(2), // Ajoutez des marges si nécessaire
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(8), // Ajoutez un rayon pour les coins
            border: Border.all(color: Colors.grey), // Ajoutez une bordure avec la couleur de votre choix
          ),
          child: Consumer<UtilisateurProvider>(
            
          builder: (context, utilisateurProvider, child) {
            final utilisateur = utilisateurProvider.utilisateur;
           return Row(
              children: [
                
                    const SizedBox(height: 130, width: 5,),
                    CircleAvatar(
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
                // Image.asset(
                //   'assets/image/me.jpg',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
                    ),
                    const SizedBox(width: 10,),
                     Text(
            "${utilisateur.prenom.toUpperCase()}" + " " + "${utilisateur.nom.toUpperCase()}" ,
            style: TextStyle(color: Color(0xFF9A6ABB), fontSize: 25, fontWeight: FontWeight.bold),
                    ), 
                    const SizedBox(width: 90,),
                    CircleAvatar(
            radius: 30,
            backgroundColor:const Color(0xFF9A6ABB),
            child: SizedBox.fromSize(
              child:const  ClipOval(
                child: Icon(Icons.notifications, size: 40,color: Colors.white,),
              ),
            ),
                    
                )
              ],
            );
          },
          ),
         ),
        
       );
  }
}