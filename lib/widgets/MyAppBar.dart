import 'package:flutter/material.dart';

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