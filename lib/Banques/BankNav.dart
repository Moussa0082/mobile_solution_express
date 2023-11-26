import 'package:flutter/material.dart';
import 'package:solution_express/Banques/BankHomeScreen.dart';
import 'package:solution_express/Banques/DemandeScreen.dart';
import 'package:solution_express/screens/BottomBar.dart';
import 'package:solution_express/screens/GuideScreen.dart';
import 'package:solution_express/screens/ProfilScreen.dart';

class BankNav extends StatefulWidget {
  const BankNav({super.key});

  @override
  State<BankNav> createState() => _BankNavState();
}

class _BankNavState extends State<BankNav> {

   int _selectedIndex = 1;

List<Widget> _listTab = <Widget>[
    GuideScreen(),
     BankHome(),
   DemandeScreen(),
   ProfilScreen()

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
      // backgroundColor : bottomNavigationBackgroundColor,
           showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Color(0xFF9A6ABB), 
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon:  Icon(Icons.home),
            // icon:  Image.asset('assets/image/home.png'),
            label: 'Accueil',
            
            // backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            // icon: Image.asset('assets/image/bank.png'),
            label: 'Banques',
            // backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
            icon:  Icon(Icons.front_hand_outlined),
            // icon:  Image.asset('assets/image/ask.png', width:40, height:40),
            label: 'Demandes',
            // backgroundColor : bottomNavigationBackgroundColor,
          ),
        BottomNavigationBarItem(
          icon:  Icon(Icons.person),
          // icon:  Image.asset('assets/image/uses.png'),
          label: 'Profil',
          // backgroundColor : bottomNavigationBackgroundColor,
        ),
        
      ],
      currentIndex: _selectedIndex,
       selectedItemColor: Color(0xFF9A6ABB),
      onTap: _currentIndex, 
      ),
    );
  }
}