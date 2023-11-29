
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:solution_express/models/Utilisateur.dart';

class UtilisateurService extends ChangeNotifier {

  static const String apiUrl = 'http://10.0.2.2:8080/user/create'; // Mettez à jour l'URL correcte
  static const String apiUrl2 = 'http://10.0.2.2:8080/user/update'; // Mettez à jour l'URL correcte
   
  
  static Future<Utilisateur> ajouterUtilisateur({
    required String nom,
    required String prenom,
    required String email,
    required String motDePasse,
    File? image,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      // request.headers.addAll({"Authorization": "Bearer token"});

      // Ajoutez l'image à la requête en utilisant le chemin du fichier
      //request.files.add(await http.MultipartFile.fromPath("photos", photos.path));
      if(image != null){
        request.files.add(http.MultipartFile('image',image.readAsBytes().asStream(),image.lengthSync(),filename : basename(image.path)));
        // debugPrint("MMM======== "+photos.path);
      }

      
      request.fields['utilisateur'] = jsonEncode({
        'nom' : nom,
        'prenom' : prenom,
        'email' : email,
        'motDePasse' : motDePasse,
        'image' : ""
      });
      var response = await request.send();
    
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 201) {
        final responseData = json.decode(responsed.body);
        debugPrint(responsed.body);
        return Utilisateur.fromJson(responseData);
      } else {
        debugPrint(responsed.body);
        throw Exception('Impossible d\'ajouter l\'utilisateur');
      }
    } catch (e) {
      throw Exception('Une erreur s\'est produite lors de l\'ajout de l\'utilisateur : $e');
    }
  } 
    // UPDATE
       Future<Utilisateur> updateUtilisateur({
      required int idUtilisateur,
      required String nom,
      required String prenom,
      required String email,
       String? motDePasse,
      File? image,
    }) async {
      try {
        var request = http.MultipartRequest('PUT', Uri.parse('$apiUrl2/$idUtilisateur'));
        // request.headers.addAll({"Authorization": "Bearer token"});

        if (image != null) {
          request.files.add(
            http.MultipartFile('image', image.readAsBytes().asStream(), image.lengthSync(),
                filename: basename(image.path),
            ),
          );
        }

        request.fields['utilisateur'] = jsonEncode({
          'nom': nom,
          'prenom': prenom,
          'email': email,
          'motDePasse': motDePasse,
          'image': "",
        });

        var response = await request.send();
        var responsed = await http.Response.fromStream(response);

        if (response.statusCode == 200) {
          final responseData = json.decode(responsed.body);
          return Utilisateur.fromJson(responseData);
        } else {
          throw Exception('Impossible de mettre à jour l\'utilisateur');
        }
      } catch (e) {
        throw Exception('Une erreur s\'est produite lors de la mise à jour de l\'utilisateur : $e');
      }
    }
    // ENDUPDATE

    void applyChange(){
    notifyListeners();
  }
}