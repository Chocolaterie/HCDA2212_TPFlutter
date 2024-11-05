import 'package:flutter/material.dart';

import 'app-theme.dart';

class HomePageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Fil", style: TextStyle(color: AppTheme.footerTextColorActive)),
          Text("Notification", style: TextStyle(color: AppTheme.footerTextColor)),
          Text("Message", style: TextStyle(color: AppTheme.footerTextColor)),
          Text("Moi", style: TextStyle(color: AppTheme.footerTextColor))
        ],
      ),
    );
  }
}