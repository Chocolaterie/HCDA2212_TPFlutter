import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_redwire/message/messages-viewmodel.dart';
import 'footer.dart';
import 'header.dart';
import 'message-card.dart';

class MessagePage extends StatelessWidget {

  void callApi(BuildContext context){
    context.read<MessagesViewModel>().callApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesViewModel(),
      builder: (context, child) {
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
              Expanded(child: Consumer<MessagesViewModel>(
                builder: (context, viewModel, child) {
                  return ListView.builder(
                      itemCount: viewModel.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Je récupère le message qui est dans la liste des messages
                        var message = viewModel.messages[index];

                        return Padding(
                          padding: const EdgeInsets.fromLTRB(
                            15.0,
                            0,
                            15.0,
                            15.0,
                          ),
                          child: MessageCard(message),
                        );
                      });
                },
              )),
              HomePageFooter()
            ],
          ),
        );
      },
    );
  }
}
