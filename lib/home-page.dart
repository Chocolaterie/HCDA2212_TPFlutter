import 'package:flutter/material.dart';
import 'footer.dart';
import 'header.dart';
import 'message-card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
      ),
      body: Column(
        children: [
          HomePageHeader(),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: MessageCard(),
              )
            ],
          )),
          HomePageFooter()
        ],
      ),
    );
  }
}
