
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solution_express/models/TypeBanque.dart';

class DepenseService extends ChangeNotifier{

  final String url = "http://10.0.2.2:8080/typeBanque/list";
  List<TypeBanque> typeBanque = [];

 Future<List<TypeBanque>> getTypeBanqueByIdBanque(int idBanque) async {
    final response = await http.get(Uri.parse("$url/$idBanque"));
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