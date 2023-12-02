
import 'dart:convert';

import 'package:solution_express/models/TypeBanque.dart';
import 'dart:convert';

// import 'package:solution_express/models/Utilisateur.dart';

// Demande demandeFromJson(String str) => Demande.fromJson(json.decode(str));

// String demandeToJson(Demande data) => json.encode(data.toJson());

// class Demande {
//     int? idDemande;
//     String heureDemande;
//     String dateDemande;
//     String photoDidentite;
//     String photoValide;
//     String statutDemande;
//     String numeroUser;
//     String numeroDemande;
//     String sexe;
//     String dateNaiss;
//     String lieuNaiss;
//     String nationnalite;
//     String adresse;
//     String statutResidence;
//     String etatCivil;
//     TypeBanque typeBanque;
//     Utilisateur utilisateur;
//     String? demandeHeureDemande;

//     Demande({
//       required  this.idDemande,
//       required  this.dateDemande,
//       required  this.heureDemande,
//       required  this.photoDidentite,
//       required  this.photoValide,
//       required  this.statutDemande,
//       required  this.numeroUser,
//       required  this.numeroDemande,
//       required  this.sexe,
//       required  this.dateNaiss,
//       required  this.lieuNaiss,
//       required  this.nationnalite,
//       required  this.adresse,
//       required  this.statutResidence,
//       required this.etatCivil,
//      required  this.typeBanque,
//          this.demandeHeureDemande, 
//         required this.utilisateur,
//     });

//     factory Demande.fromJson(Map<String, dynamic> json) => Demande(
//         idDemande: json["idDemande"],
//         dateDemande: json["dateDemande"],
//         heureDemande: json["HeureDemande"],
//         photoDidentite: json["photoDidentite"],
//         photoValide: json["photoValide"],
//         statutDemande: json["statutDemande"],
//         numeroUser: json["numeroUser"],
//         numeroDemande: json["numeroDemande"],
//         sexe: json["sexe"],
//         dateNaiss: json["dateNaiss"],
//         lieuNaiss: json["lieuNaiss"],
//         nationnalite: json["nationnalite"],
//         adresse: json["adresse"],
//         statutResidence: json["statutResidence"],
//         etatCivil: json["etatCivil"],
//         typeBanque: TypeBanque.fromJson(json["typeBanque"]),
//         utilisateur: Utilisateur.fromJson(json["utilisateur"]),
//         demandeHeureDemande: json["heureDemande"],
//     );

//     Map<String, dynamic> toJson() => {
//         "idDemande": idDemande,
//         "dateDemande": dateDemande,
//         "HeureDemande": heureDemande,
//         "photoDidentite": photoDidentite,
//         "photoValide": photoValide,
//         "statutDemande": statutDemande,
//         "numeroUser": numeroUser,
//         "numeroDemande": numeroDemande,
//         "sexe": sexe,
//         "dateNaiss": dateNaiss,
//         "lieuNaiss": lieuNaiss,
//         "nationnalite": nationnalite,
//         "adresse": adresse,
//         "statutResidence": statutResidence,
//         "etatCivil": etatCivil,
//         "typeBanque": typeBanque.toJson(),
//         "utilisateur": utilisateur.toJson(),
//         "heureDemande": demandeHeureDemande,
//     };

   
// }

import 'dart:convert';

import 'package:solution_express/models/Utilisateur.dart';

Demande demandeFromJson(String str) => Demande.fromJson(json.decode(str));

String demandeToJson(Demande data) => json.encode(data.toJson());

class Demande {
    int? idDemande;
    String? photoDidentite;
    String? photoValide;
    String numeroUser;
    String sexe;
    String dateNaiss;
    String lieuNaiss;
    String nationnalite;
    String adresse;
    String statutResidence;
    String etatCivil;
    TypeBanque typeBanque;
    Utilisateur utilisateur;
    String? demandeHeureDemande;

    Demande({
         this.idDemande,
         this.photoDidentite,
         this.photoValide,
        required this.numeroUser,
        required this.sexe,
        required this.dateNaiss,
        required this.lieuNaiss,
        required this.nationnalite,
        required this.adresse,
        required this.statutResidence,
        required this.etatCivil,
        required this.typeBanque,
        required this.utilisateur,
    });

    factory Demande.fromJson(Map<String, dynamic> json) => Demande(
        photoDidentite: json["photoDidentite"],
        photoValide: json["photoValide"],
        numeroUser: json["numeroUser"],
        sexe: json["sexe"],
        dateNaiss: json["dateNaiss"],
        lieuNaiss: json["lieuNaiss"],
        nationnalite: json["nationnalite"],
        adresse: json["adresse"],
        statutResidence: json["statutResidence"],
        etatCivil: json["etatCivil"],
        typeBanque: TypeBanque.fromJson(json["typeBanque"]),
        utilisateur: Utilisateur.fromJson(json["utilisateur"]),
    );

   Map<String, dynamic> toJson() {
  return {
    "demande": {
      "idDemande": idDemande,
      "photoDidentite": photoDidentite,
      "photoValide": photoValide,
      "numeroUser": numeroUser,
      "sexe": sexe,
      "dateNaiss": dateNaiss,
      "lieuNaiss": lieuNaiss,
      "nationnalite": nationnalite,
      "adresse": adresse,
      "statutResidence": statutResidence,
      "etatCivil": etatCivil,
      "typeBanque": typeBanque.toJson(),
      "utilisateur": utilisateur.toJson(),
    }
  };
}

   Map<String, dynamic> toMap() {
    return {
      "idDemande": idDemande,
      "photoDidentite": photoDidentite,
      "photoValide": photoValide,
      "numeroUser": numeroUser,
      "sexe": sexe,
       "dateNaiss": dateNaiss,
      "lieuNaiss": lieuNaiss,
      "nationnalite": nationnalite,
      "adresse": adresse,
      "statutResidence": statutResidence,
      "etatCivil": etatCivil,
      "typeBanque": typeBanque.toJson(),
      "utilisateur": utilisateur.toJson(),
    };
  }
    
}
