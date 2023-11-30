

import 'package:flutter/material.dart';
import 'package:solution_express/models/Demande.dart';

class DemandeProvider with ChangeNotifier {
  Demande? _demande;

  Demande? get demande => _demande;

  void setDemande(Demande demande) {
    _demande = demande;
    notifyListeners(); 
  }
}