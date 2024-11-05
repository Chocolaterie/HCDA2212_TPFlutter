import 'package:flutter/material.dart';

import 'app-theme.dart';

class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppTheme.primaryLinearGradient),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Nouveau",
              style: TextStyle(color: Colors.white),
            ),
            Text("Accueil", style: TextStyle(color: Colors.white)),
            Text("Rechercher", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}