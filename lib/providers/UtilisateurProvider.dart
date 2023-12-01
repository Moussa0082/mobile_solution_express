
import 'package:flutter/material.dart';
import 'package:solution_express/models/Utilisateur.dart';
import 'package:solution_express/screens/LoginScreen.dart';

class UtilisateurProvider with ChangeNotifier {
  Utilisateur? _utilisateur;

  Utilisateur? get utilisateur => _utilisateur;

  void setUtilisateur(Utilisateur utilisateur) {
    _utilisateur = utilisateur;
    notifyListeners(); 
  }


  Future<void> logout() async {
    // Supprimer les données utilisateur
    _utilisateur = null;
    notifyListeners();
    // Rediriger vers la page de connexion

  
}

}