import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import 'app-theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "mobile_background.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Spacer( flex: 2),
                Image.asset(
                  "sign_in_icon.png",
                  width: 126,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Connexion",
                    style: TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                  ),
                ),
                AppTheme.wrapField(TextField(
                  decoration: AppTheme.appTextField(
                      "Email", "Veuillez saisir un Email"),
                )),
                AppTheme.wrapField(TextField(
                  decoration: AppTheme.appTextField(
                      "Mot de passe", "Veuillez saisir un mot de passe"),
                )),
                AppTheme.wrapField(Row(
                  children: [
                    Switch(value: false, onChanged: (value) => {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Memoriser mes informations", style: TextStyle(color: Color(0xDDFFFFFF))),
                    )
                  ],
                )),
                Spacer( flex: 1),
                AppTheme.wrapField(SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text("Connexion"),
                        ))),),
                Spacer( flex: 6),
              ],
            ),
          )
        ],
      ),
    );
  }
}
