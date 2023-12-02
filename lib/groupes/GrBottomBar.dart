
import 'package:flutter/material.dart';
import 'package:solution_express/constant/Constantes.dart';
import 'package:solution_express/groupes/CategorieScreen.dart';
import 'package:solution_express/groupes/MyPaymentScreen.dart';
import 'package:solution_express/screens/GuideScreen.dart';
import 'package:solution_express/screens/ProfilScreen.dart';


class GrBottomBar extends StatefulWidget {
  const GrBottomBar({super.key});

  @override
  State<GrBottomBar> createState() => _GrBottomBarState();
}

final bottomNavigationBackgroundColor = kAppBarColor;


class _GrBottomBarState extends State<GrBottomBar> {
   
       int _selectedIndex =2;

final List<Widget> _listTab = <Widget>[
  const GuideScreen(),
  const MyPaymentScreen(),
  const CategorieScreen(),
  const ProfilScreen(),

];

  void _currentIndex (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(
        child: _listTab.elementAt(_selectedIndex),
      ), 
      
     bottomNavigationBar: BottomNavigationBar(
      backgroundColor : bottomNavigationBackgroundColor,
  
         showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Color(0xFF9A6ABB), 
          
      items: <BottomNavigationBarItem> [
        

        BottomNavigationBarItem(
            icon:  Icon(Icons.home),
            label: 'Accueil',
            backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
            icon:  Icon(Icons.payment),
            label: 'Mes Paiements',
            backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
            icon:  Icon(Icons.group),
            label: 'Groupes',
            backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
          icon:  Icon(Icons.person),
          label: 'Profil',
          backgroundColor : bottomNavigationBackgroundColor,
        ),
        
      ],
      currentIndex: _selectedIndex,
       selectedItemColor: Color(0xFF9A6ABB),
      onTap: _currentIndex, 
      ),
    );
  }
}