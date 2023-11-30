import 'dart:convert';

import 'package:solution_express/models/Banque.dart';

TypeBanque typeBanqueFromJson(String str) => TypeBanque.fromJson(json.decode(str));

String typeBanqueToJson(TypeBanque data) => json.encode(data.toJson());

class TypeBanque {
    int idTypeBanque;
    String nom;
    String description;
    String image;
    String? dateCreated;
    Banque? banque;

    TypeBanque({
        required this.idTypeBanque,
        required this.nom,
        required this.description,
        required this.image,
         this.dateCreated,
         this.banque,
    });

    factory TypeBanque.fromJson(Map<String, dynamic> json) => TypeBanque(
        idTypeBanque: json["idTypeBanque"],
        nom: json["nom"],
        description: json["description"],
        image: json["image"],
        dateCreated: json["dateCreated"],
        banque: Banque.fromJson(json["banque"]),
    );

    Map<String, dynamic> toJson() => {
        "idTypeBanque": idTypeBanque,
        "nom": nom,
        "description": description,
        "image": image,
        "dateCreated": dateCreated,
        "banque": banque?.toJson(),
    };

    Map<String, dynamic> toMap(){
    return{
      "idTypeBanque":idTypeBanque,
      "nom":nom,
      "descripton":description,
      "image":image,
      "dateCreated":dateCreated,
      "banque":banque?.toJson()
    };
  }
}