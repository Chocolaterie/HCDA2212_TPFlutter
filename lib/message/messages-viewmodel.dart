import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'message.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MessagesViewModel with ChangeNotifier {

  List<Message> messages = [];

  /// Appel l'api
  void callApi(BuildContext context) async {

    // Affiche l'ecran de chargement
    var pd = ProgressDialog(context: context);
    pd.show(
      msg: "Récupération des messages...",
      barrierColor: Color(0x77000000),
      progressBgColor: Colors.transparent,
      elevation: 10.0
    );

    // Simuler 1 second d'attente
    await Future.delayed(Duration(seconds: 1));

    // l'url
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // appeler l'url
    var response = await http.get(url);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // mapper le json en liste de Tweet
    messages = List<Message>.from(responseBodyJson
        .map((messageJson) => Message.fromJson(messageJson))
        .toList());

    // Fermer l'ecran de chargement
    pd.close();

    notifyListeners();
  }
}