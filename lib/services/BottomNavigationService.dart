import 'package:flutter/material.dart';

class BottomNavigationService extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changeIndex(int value){
    if(value != _pageIndex){
      _pageIndex = value;
      notifyListeners();
    }
  }
}