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
            IconButton(onPressed: () {}, icon: Image.asset("pencil.png", width: 26,)),
            Text("Accueil", style: TextStyle(color: Colors.white)),
            IconButton(onPressed: () {}, icon: Image.asset("search.png", width: 26,)),
          ],
        ),
      ),
    );
  }
}