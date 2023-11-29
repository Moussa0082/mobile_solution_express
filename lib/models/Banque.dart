import 'dart:convert';

import 'package:solution_express/models/TypeBanque.dart';

Banque banqueFromJson(String str) => Banque.fromJson(json.decode(str));

String banqueToJson(Banque data) => json.encode(data.toJson());

class Banque {
    int idBanque;
    String nom;
    String adresse;
    String image;
    String dateCreated;
    List<TypeBanque> typeBanque;

    Banque({
        required this.idBanque,
        required this.nom,
        required this.adresse,
        required this.image,
        required this.dateCreated,
        required this.typeBanque,
    });

    factory Banque.fromJson(Map<String, dynamic> json) => Banque(
        idBanque: json["idBanque"],
        nom: json["nom"],
        adresse: json["adresse"],
        image: json["image"],
        dateCreated: json["dateCreated"], typeBanque: [],
        // typeBanque: List<TypeBanque>.from(json["typeBanque"].map((x) => TypeBanque.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idBanque": idBanque,
        "nom": nom,
        "adresse": adresse,
        "image": image,
        "dateCreated": dateCreated,
        // "typeBanque": List<dynamic>.from(typeBanque.map((x) => x.toJson())),
    };
}