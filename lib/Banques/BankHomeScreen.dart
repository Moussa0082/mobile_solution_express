import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/Banques/TypeInfoScreen.dart';
import 'package:solution_express/Banques/TypesScreen.dart';
import 'package:solution_express/models/Banque.dart';
import 'package:solution_express/models/TypeBanque.dart';
import 'package:solution_express/services/BanqueService.dart';
import 'package:solution_express/widgets/MyAppBar.dart';

class BankHome extends StatefulWidget {
  const BankHome({super.key});

  @override
  State<BankHome> createState() => _BankHomeState();
}


class _BankHomeState extends State<BankHome> {

  late Future<List<Banque>> _futureListBanque;
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _futureListBanque =
        BanqueService().getListBanque("/read");
        _searchController = TextEditingController();
  }


   @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: MyAppBare(),
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25,),
        
           const SizedBox(height: 8,),
           Container(
            padding:EdgeInsets.all(10),
             child: Column(
         children: [
           Row(
             children: [
               Expanded(
                 child: Container(
                   padding: EdgeInsets.only(left: 5),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30),
               
                   ),
                   child: TextField(
                    controller: _searchController,
                     onChanged: (value) {
                            setState(() {
                              // Le changement de texte déclenche la reconstruction du widget
                            });
                          },
                     decoration: InputDecoration(
                       hintText: 'Rechercher',
                       contentPadding: EdgeInsets.all(10),
                       border: InputBorder.none,
                     ),
                   ),
                 ),
               ),
               SizedBox(width: 10),
               Container(
                 height: 50,
                 width: 50,
                 decoration: BoxDecoration(
                  
                   borderRadius: BorderRadius.all(
                     Radius.circular(25),
                   ),
                 ),
                 child: ElevatedButton(
                   onPressed: () {
                     // Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) {
                     //       return CalendarPage();
                     //     },
                     //   ),
                     // );
                   },
                   child: Icon(
                     Icons.search,
                     color: Colors.white,
                     size: 26,
                   ),
                   style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.all(10),
                     shape: CircleBorder(),
                     shadowColor: Colors.white,
                     primary: Color(0xFF9A6ABB),
                   ),
                 ),
               )
             ],
           ),
          
             
         ],
             ),
           ),
        
            const SizedBox(height:10),
           SingleChildScrollView(
            child:
     Consumer<BanqueService>(
  builder: (context, banqueService, child) {
    return Expanded(
      child: FutureBuilder<List<Banque>>(
        future: banqueService.getListBanque("/read"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Aucune banque trouvée"),
            );
          } 
          else {
                      // Filtrer la liste des banques en fonction du texte de recherche
                      List<Banque> banques = snapshot.data!
                          .where((banque) => banque.nom
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase()))
                          .toList();
          // else {
          //   List<Banque> banques = snapshot.data!;

            return Wrap(
              spacing: 6,
              runSpacing: 6,
              children: banques.map((Banque banque) {
                return GestureDetector(
                  onTap: () async {
                        List<TypeBanque> typesBanque = await BanqueService().getTypeBanqueByIdBanque(banque.idBanque);
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TypeScreen(typesBanque: typesBanque, banque: banque.nom,),
                    ),
                  );
                    // Faites quelque chose lorsque la banque est sélectionnée
                  },
                  child: Container(
                    width: 165,
                    height: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                        "http://10.0.2.2/" + banque.image,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(height: 10),
                        Text(
                          banque.nom,
                          style: TextStyle(
                            color: Color(0xFF9A6ABB),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  },
)

           ),
        
        
        
        
          ],
        
        ),
      ),
    );
  }
}


/* 
SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 25),
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              // Le changement de texte déclenche la reconstruction du widget
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Rechercher',
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Vous pouvez ajouter une logique de recherche ici
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 26,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          shadowColor: Colors.white,
                          primary: Color(0xFF9A6ABB),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<Banque>>(
            future: BanqueService().getListBanque("/read"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("Aucune banque trouvée"),
                );
              } else {
                List<Banque> banques = snapshot.data!;
                List<Banque> filteredBanques = banques.where((banque) {
                  // Filtrer les banques en fonction du texte de recherche
                  return banque.nom.toLowerCase().contains(_searchController.text.toLowerCase());
                }).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredBanques.length,
                  itemBuilder: (context, index) {
                    Banque banque = filteredBanques[index];

                    return GestureDetector(
                      onTap: () async {
                        List<TypeBanque> typesBanque = await BanqueService().getTypeBanqueByIdBanque(banque.idBanque);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TypeScreen(typesBanque: typesBanque, banque: banque.nom),
                          ),
                        );
                      },
                      child: Container(
                        width: 165,
                        height: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "http://10.0.2.2/" + banque.image,
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(height: 10),
                            Text(
                              banque.nom,
                              style: TextStyle(
                                color: Color(0xFF9A6ABB),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
*/