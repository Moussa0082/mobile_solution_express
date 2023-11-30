

import 'package:flutter/material.dart';
import 'package:solution_express/models/TypeBanque.dart';

class TypeBanqueProvider with ChangeNotifier {
  TypeBanque? _typeBanque;

  TypeBanque? get typeBanque => _typeBanque;

  void setTypeBanque(TypeBanque typeBanque) {
    _typeBanque = typeBanque;
    notifyListeners(); 
  }
}