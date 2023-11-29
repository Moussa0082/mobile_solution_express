
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solution_express/models/Banque.dart';
import 'package:solution_express/models/TypeBanque.dart';

class BanqueService extends ChangeNotifier{

     final String url = "http://10.0.2.2:8080/banque";
  
    

  Future<List<Banque>> getListBanque(String endpoint) async {
    final response = await http.get(Uri.parse(url + endpoint));
    if (response.statusCode == 200) {
          // banqueList = List<Map<String, dynamic>>.from(json.decode(response.body));
          // mapResponse = maladiesList[index];
          // isExpandedList = List.generate(maladiesList.length, (index) => false);
          // filteredMaladiesList = List<Map<String, dynamic>>.from(maladiesList);
          // isLoading = false;
        
       final List<dynamic> data = jsonDecode(response.body);
    final List<Banque> banques = data.map((json) => Banque.fromJson(json)).toList();
    return banques;
    
      // return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(utf8.decode(response.bodyBytes))["message"]);
    }
  }

  final String url1 = "http://10.0.2.2:8080/typeBanque/list";
  List<TypeBanque> typeBanque = [];

 Future<List<TypeBanque>> getTypeBanqueByIdBanque(int idBanque) async {
    final response = await http.get(Uri.parse("$url1/$idBanque"));
    debugPrint("$url/$idBanque");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      typeBanque =
          body.map((dynamic item) => TypeBanque.fromJson(item)).toList();
      return typeBanque;
    } else {
      throw Exception(jsonDecode(utf8.decode(response.bodyBytes))["message"]);
    }
  }


  

}