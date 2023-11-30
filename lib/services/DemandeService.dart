
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:solution_express/models/Demande.dart';
import 'package:solution_express/models/TypeBanque.dart';
import 'package:http/http.dart' as http;
import 'package:solution_express/models/Utilisateur.dart';

class DemandeService extends ChangeNotifier{

  static const String apiUrl = 'http://10.0.2.2:8080/demandes/send';

//    Future<Demande> faireDemande({
//      File? photoDidentite,
//      File? photoValide,
//      String? numeroUser,
//      String? sexe,
//      String? dateNaiss,
//      String? lieuNaiss,
//      String? nationnalite,
//      String? adresse,
//      String? statutResidence,
//      String? etatCivil,
//      required TypeBanque typeBanque,
//      required Utilisateur utilisateur,
//   }) async {

//     try {
//     var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8080/demandes/send'));

//     if (photoDidentite != null) {
//       request.files.add(http.MultipartFile('photoDidentite', photoDidentite.readAsBytes().asStream(), photoDidentite.lengthSync(), filename: basename(photoDidentite.path)));
//     }

//     if (photoValide != null) {
//       request.files.add(http.MultipartFile('photoValide', photoValide.readAsBytes().asStream(), photoValide.lengthSync(), filename: basename(photoValide.path)));
//     }

//     Map<String, dynamic> demande = {
//       'photoDidentite': photoDidentite,
//       'photoValide': photoValide,
//       'numeroUser': numeroUser,
//       'sexe': sexe,
//       'dateNaiss': dateNaiss,
//       'lieuNaiss': lieuNaiss,
//       'nationnalite': nationnalite,
//       'adresse': adresse,
//       'statutResidence': statutResidence,
//       'etatCivil': etatCivil,
//       'typeBanque': typeBanque.toJson(),
//       'utilisateur': utilisateur.toJson(),
//     };

//     request.fields['demande'] = jsonEncode(demande);

//     var response = await request.send();
//     var responsed = await http.Response.fromStream(response);

//     if (response.statusCode == 200) {
//       final responseData = json.decode(responsed.body);
//       debugPrint(responsed.body);
//       return Demande.fromJson(responseData);
//     } else {
//       debugPrint(responsed.body);
//       throw Exception('Impossible de faire une demande');
//     }
//   } catch (e) {
//     throw Exception('Une erreur s\'est produite lors de la demande : $e');
//   }
// }

Future<Demande> faireDemande({
  File? photoDidentite,
  File? photoValide,
  String? numeroUser,
  String? sexe,
  String? dateNaiss,
  String? lieuNaiss,
  String? nationnalite,
  String? adresse,
  String? statutResidence,
  String? etatCivil,
  required TypeBanque typeBanque,
  required Utilisateur utilisateur,
}) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8080/demandes/send'));

    if (photoDidentite != null) {
      request.files.add(http.MultipartFile(
        'photoDidentite',
        photoDidentite.readAsBytes().asStream(),
        photoDidentite.lengthSync(),
        filename: basename(photoDidentite.path),
      ));
    }

    if (photoValide != null) {
      request.files.add(http.MultipartFile(
        'photoValide',
        photoValide.readAsBytes().asStream(),
        photoValide.lengthSync(),
        filename: basename(photoValide.path),
      ));
    }

    Map<String, dynamic> demande = {
      'numeroUser': numeroUser,
      'sexe': sexe,
      'dateNaiss': dateNaiss,
      'lieuNaiss': lieuNaiss,
      'nationnalite': nationnalite,
      'adresse': adresse,
      'statutResidence': statutResidence,
      'etatCivil': etatCivil,
      'typeBanque': typeBanque.toJson(),
      'utilisateur': utilisateur.toJson(),
    };

    request.fields['demande'] = jsonEncode(demande);

    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 500) {
      final responseData = json.decode(responsed.body);
      debugPrint(responsed.body);
      return Demande.fromJson(responseData);
    } else {
      debugPrint(responsed.body);
      throw Exception('Impossible de faire une demande');
    }
  } catch (e) {
    throw Exception('Une erreur s\'est produite lors de la demande : $e');
  }
}
//     Map<String, int?> typeMap = {"idTypeBanque": typeBanque.idTypeBanque};
//     Map<String, int?> ut = {"idUtilisateur": utilisateur.idUtilisateur};
   
    

//     final response = await http.post(
//   Uri.parse('http://10.0.2.2:8080/demandes/send'),
//   headers: {'Content-Type': 'application/json'},
//   body: jsonEncode({'demande': demande}),
// );

//     if (response.statusCode == 200) {
//       debugPrint(response.body);
//       debugPrint(demande.toString());
//       // Parsez la réponse JSON pour obtenir une instance de Demande
//     Demande updatedDemande = Demande.fromJson(json.decode(response.body));
    
//       applyChange();
//       return updatedDemande;
//     } else {
//       debugPrint(response.body);
//       throw Exception(
//           'Impossible de faire une demande ${response.statusCode}');
//     }

   
//   }

  void applyChange() {
    notifyListeners();
  }

 

}