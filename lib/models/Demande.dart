
import 'dart:convert';

import 'package:solution_express/models/TypeBanque.dart';
import 'dart:convert';

import 'package:solution_express/models/Utilisateur.dart';

Demande demandeFromJson(String str) => Demande.fromJson(json.decode(str));

String demandeToJson(Demande data) => json.encode(data.toJson());

class Demande {
    int? idDemande;
    String? dateDemande;
    String? heureDemande;
    String? photoDidentite;
    String? photoValide;
    String? statutDemande;
    String? numeroUser;
    String? numeroDemande;
    String? sexe;
    String? dateNaiss;
    String? lieuNaiss;
    String? nationnalite;
    String? adresse;
    String? statutResidence;
    String? etatCivil;
    TypeBanque typeBanque;
    Utilisateur utilisateur;
    String? demandeHeureDemande;

    Demande({
         this.idDemande,
         this.dateDemande,
         this.heureDemande,
         this.photoDidentite,
         this.photoValide,
         this.statutDemande,
         this.numeroUser,
         this.numeroDemande,
         this.sexe,
         this.dateNaiss,
         this.lieuNaiss,
         this.nationnalite,
         this.adresse,
         this.statutResidence,
         this.etatCivil,
        required this.typeBanque,
         this.demandeHeureDemande, 
        required  this.utilisateur,
    });

    factory Demande.fromJson(Map<String, dynamic> json) => Demande(
        idDemande: json["idDemande"],
        dateDemande: json["dateDemande"],
        heureDemande: json["HeureDemande"],
        photoDidentite: json["photoDidentite"],
        photoValide: json["photoValide"],
        statutDemande: json["statutDemande"],
        numeroUser: json["numeroUser"],
        numeroDemande: json["numeroDemande"],
        sexe: json["sexe"],
        dateNaiss: json["dateNaiss"],
        lieuNaiss: json["lieuNaiss"],
        nationnalite: json["nationnalite"],
        adresse: json["adresse"],
        statutResidence: json["statutResidence"],
        etatCivil: json["etatCivil"],
        typeBanque: TypeBanque.fromJson(json["typeBanque"]),
        utilisateur: Utilisateur.fromJson(json["utilisateur"]),
        demandeHeureDemande: json["heureDemande"],
    );

    Map<String, dynamic> toJson() => {
        "idDemande": idDemande,
        "dateDemande": dateDemande,
        "HeureDemande": heureDemande,
        "photoDidentite": photoDidentite,
        "photoValide": photoValide,
        "statutDemande": statutDemande,
        "numeroUser": numeroUser,
        "numeroDemande": numeroDemande,
        "sexe": sexe,
        "dateNaiss": dateNaiss,
        "lieuNaiss": lieuNaiss,
        "nationnalite": nationnalite,
        "adresse": adresse,
        "statutResidence": statutResidence,
        "etatCivil": etatCivil,
        "typeBanque": typeBanque.toJson(),
        "utilisateur": utilisateur.toJson(),
        "heureDemande": demandeHeureDemande,
    };

   
}
