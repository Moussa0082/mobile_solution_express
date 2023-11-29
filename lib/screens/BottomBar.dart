
import 'package:flutter/material.dart';
import 'package:solution_express/constant/Constantes.dart';
import 'package:solution_express/screens/GuideScreen.dart';
import 'package:solution_express/screens/LoginScreen.dart';
import 'package:solution_express/screens/ProfilScreen.dart';




class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}
final bottomNavigationBackgroundColor = kAppBarColor;

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

List<Widget> _listTab = <Widget>[
   GuideScreen(),
   ProfilScreen(),
   

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