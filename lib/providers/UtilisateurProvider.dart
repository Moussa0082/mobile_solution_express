
import 'package:flutter/material.dart';
import 'package:solution_express/models/Utilisateur.dart';

class UtilisateurProvider with ChangeNotifier {
  Utilisateur? _utilisateur;

  Utilisateur? get utilisateur => _utilisateur;

  void setUtilisateur(Utilisateur utilisateur) {
    _utilisateur = utilisateur;
    notifyListeners(); 
  }
}