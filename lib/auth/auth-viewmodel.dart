import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_redwire/auth-context.dart';

import '../app-dialog-helpers.dart';

class AuthViewModel with ChangeNotifier {

  void callApi(BuildContext context, String email, String password) async {

    // Affiche l'ecran de chargement
    AppDialogHelper.showProgressDialog(context, "Tentative de connexion...");

    // Simuler 1 seconde d'attente
    await Future.delayed(Duration(seconds: 1));

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

    // Fermer l'ecran de chargement
    AppDialogHelper.closeProgressDialog();

    // Si ok
    if (responseBodyJson["code"] == "200"){
      // Message succès
      AppDialogHelper.showMyDialog(context, "Connexion", responseBodyJson["message"], callbackOk: () {
        Navigator.pushNamed(context, "/message");
      });
      AuthContext.token = responseBodyJson["data"] as String;
    }
    // Si pas ok
    else {
      // Todo : Remplacer popup alert (AlertDialog)
      // Message d'erreur
      AppDialogHelper.showMyDialog(context, "Erreur", responseBodyJson["message"]);
    }
  }

}