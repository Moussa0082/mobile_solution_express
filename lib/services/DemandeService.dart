
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solution_express/models/TypeBanque.dart';
import 'package:http/http.dart' as http;
import 'package:solution_express/models/Utilisateur.dart';

class DemandeService extends ChangeNotifier{

   Future<void> faireDemande({
    required String description,
    required String photoDidentite,
    required String photoValide,
    required String statutdemande,
    required String numeroUser,
    required String sexe,
    required String dateNaiss,
    required String lieuNaiss,
    required String nationnalite,
    required String adresse,
    required String statutResidence,
    required String etatCivil,
    required TypeBanque typeBanque,
    required Utilisateur utilisateur,
  }) async {
    Map<String, int?> typeMap = {"idTypeBanque": typeBanque.idTypeBanque};
    Map<String, int?> ut = {"idUtilisateur": utilisateur.idUtilisateur};
    var demande = jsonEncode({
      'description': description,
      'photoDidentite': photoDidentite,
      'photoValide': photoValide,
      'statutdemande': statutdemande,
      'numeroUser': numeroUser,
      'sexe': sexe,
      'dateNaiss': dateNaiss,
      'lieuNaiss': lieuNaiss,
      'nationnalite': nationnalite,
      'adresse': adresse,
      'statutResidence': statutResidence,
      'etatCivil': etatCivil,
      'typeBanque': typeBanque.toMap(),
      'utilisateur': ut,
    });

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/demande/send'),
      headers: {'Content-Type': 'application/json'},
      body: demande,
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      debugPrint(demande.toString());
      applyChange();
    } else {
      debugPrint(response.body);
      throw Exception(
          'Impossible de faire une demande ${response.statusCode}');
    }
  }

  void applyChange() {
    notifyListeners();
  }

 

}