import 'package:flutter/material.dart';
import 'package:tp_redwire/startup-splashscreen.dart';

import 'home-page.dart';
import 'login-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Fil Rouge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => StartupPage(),
        '/login' : (context) => LoginPage(),
      },
    );
  }
}