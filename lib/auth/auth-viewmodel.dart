import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AuthViewModel with ChangeNotifier {

  void callApi(BuildContext context, String email, String password) async {
    // Le header application/json
    final headers = {'Content-Type': 'application/json'};

    // Preparer la requête (email / password)
    final bodyRequest = convert.jsonEncode(
        {'email': email, 'password': password});

    // Appeler l'api
    var responseHttp = await http.post(Uri.parse("http://localhost:3000/login"),
        headers: headers, body: bodyRequest);

    // Récupérer la rep http en json
    var responseBodyJson = convert.jsonDecode(responseHttp.body);

    // Si ok
    if (responseBodyJson["code"] == "200"){
      // Message succès
      // Todo : Remplacer popup alert (AlertDialog)
      // Todo (Optionnel) : Si tu peux, quand tu clique sur le OK/fermer la popup -> change de page
      print(responseBodyJson["message"]);
      // Todo stocker le token quelque part
      // Proposition : le mettre dans un static
    }
    // Si pas ok
    else {
      // Todo : Remplacer popup alert (AlertDialog)
      // Message d'erreur
      print(responseBodyJson["message"]);
    }
  }

}