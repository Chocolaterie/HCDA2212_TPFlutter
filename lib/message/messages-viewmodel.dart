import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:tp_redwire/app-dialog-helpers.dart';
import 'package:tp_redwire/auth-context.dart';

import 'message.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MessagesViewModel with ChangeNotifier {

  List<Message> messages = [];

  /// Appel l'api
  void callApi(BuildContext context) async {

    // Affiche l'ecran de chargement
    AppDialogHelper.showProgressDialog(context, "Récupération des messages...");

    // Simuler 1 second d'attente
    await Future.delayed(Duration(seconds: 1));

    // Construire le header
    final headers = {
      "Authorization" : "Bearer ${AuthContext.token}"
    };

    // l'url
    var url = Uri.parse(
        "http://localhost:3000/messages");

    // appeler l'url
    try {
      var response = await http.get(url, headers: headers);

      // mapper la reponse en json
      var responseBodyJson = convert.jsonDecode(response.body);

      // Fermer l'ecran de chargement
      AppDialogHelper.closeProgressDialog();

      // Controler les erreurs Http
      if (response.statusCode == 200) {
        // Si j'ai le code metier 200
        if (responseBodyJson['code'] == "200") {
          // mapper le json en liste de Tweet
          messages = List<Message>.from(responseBodyJson['data']
              .map((messageJson) => Message.fromJson(messageJson))
              .toList());
        }
        else {
          AppDialogHelper.showMyDialog(
              context, "Erreur", responseBodyJson['message']);
        }
      } else {
        AppDialogHelper.showMyDialog(context, "Erreur", "Erreur inconnue");
      }
      notifyListeners();
    }
    catch (_, e) {
      // Fermer l'ecran de chargement
      AppDialogHelper.closeProgressDialog();
      // Dialog error
      AppDialogHelper.showMyDialog(context, "Erreur", "Erreur réseau");
    }
  }
}