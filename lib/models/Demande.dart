
import 'dart:convert';

import 'package:solution_express/models/TypeBanque.dart';
import 'package:solution_express/models/Utilisateur.dart';

Banque banqueFromJson(String str) => Banque.fromJson(json.decode(str));

String banqueToJson(Banque data) => json.encode(data.toJson());

class Banque {
    int idDemande;
    String dateDemande;
    String heureDemande;
    String photoDidentite;
    String photoValide;
    String statutDemande;
    String numeroUser;
    String numeroDemande;
    String sexe;
    DateTime dateNaiss;
    String lieuNaiss;
    String nationnalite;
    String adresse;
    String statutResidence;
    String etatCivil;
    TypeBanque typeBanque;
    Utilisateur utilisateur;
    String banqueHeureDemande;

    Banque({
        required this.idDemande,
        required this.dateDemande,
        required this.heureDemande,
        required this.photoDidentite,
        required this.photoValide,
        required this.statutDemande,
        required this.numeroUser,
        required this.numeroDemande,
        required this.sexe,
        required this.dateNaiss,
        required this.lieuNaiss,
        required this.nationnalite,
        required this.adresse,
        required this.statutResidence,
        required this.etatCivil,
        required this.typeBanque,
        required this.utilisateur,
        required this.banqueHeureDemande,
    });

    factory Banque.fromJson(Map<String, dynamic> json) => Banque(
        idDemande: json["idDemande"],
        dateDemande: json["dateDemande"],
        heureDemande: json["HeureDemande"],
        photoDidentite: json["photoDidentite"],
        photoValide: json["photoValide"],
        statutDemande: json["statutDemande"],
        numeroUser: json["numeroUser"],
        numeroDemande: json["numeroDemande"],
        sexe: json["sexe"],
        dateNaiss: DateTime.parse(json["dateNaiss"]),
        lieuNaiss: json["lieuNaiss"],
        nationnalite: json["nationnalite"],
        adresse: json["adresse"],
        statutResidence: json["statutResidence"],
        etatCivil: json["etatCivil"],
        typeBanque: TypeBanque.fromJson(json["typeBanque"]),
        utilisateur: Utilisateur.fromJson(json["utilisateur"]),
        banqueHeureDemande: json["heureDemande"],
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
        "dateNaiss": dateNaiss.toIso8601String(),
        "lieuNaiss": lieuNaiss,
        "nationnalite": nationnalite,
        "adresse": adresse,
        "statutResidence": statutResidence,
        "etatCivil": etatCivil,
        "typeBanque": typeBanque.toJson(),
        "utilisateur": utilisateur.toJson(),
        "heureDemande": banqueHeureDemande,
    };
}
