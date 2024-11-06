import 'package:flutter/material.dart';
import 'footer.dart';
import 'header.dart';
import 'message-card.dart';
import 'message.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Message> messages = [];

  /// Appel l'api
  void callApi(BuildContext context) async {
    // l'url
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // appeler l'url
    var response = await http.get(url);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    setState(() {
      // mapper le json en liste de Tweet
      messages = List<Message>.from(responseBodyJson
          .map((messageJson) => Message.fromJson(messageJson))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomePageHeader(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () {
                  callApi(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Rafraichir"),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Je récupère le message qui est dans la liste des messages
                    var message = messages[index];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                        15.0,
                        0,
                        15.0,
                        15.0,
                      ),
                      child: MessageCard(message),
                    );
                  })),
          HomePageFooter()
        ],
      ),
    );
  }
}
