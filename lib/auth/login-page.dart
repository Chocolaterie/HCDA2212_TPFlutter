import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_redwire/app-validator.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_redwire/auth/auth-viewmodel.dart';

import '../app-theme.dart';

class LoginPage extends StatelessWidget {

  TextEditingController emailController = TextEditingController(text: "isaac@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "password");

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void callApi(BuildContext context) async {
    // Récupérer la saisie
    String email = emailController.text;
    String password = passwordController.text;

    // Appeler le viewmodel
    context.read<AuthViewModel>().callApi(context, email, password);
  }

  void onSubmit(BuildContext context){
    if (_key.currentState!.validate()){
      callApi(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
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
                child: Form(
                  key: _key,
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
                      AppTheme.wrapField(TextFormField(
                        controller: emailController,
                        validator: AppValidator.validateEmail,
                        decoration: AppTheme.appTextField(
                            "Email", "Veuillez saisir un Email"),
                      )),
                      AppTheme.wrapField(TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: AppValidator.validatePassword,
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
                              onPressed: () { onSubmit(context); },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text("Connexion"),
                              ))),),
                      Spacer( flex: 6),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
