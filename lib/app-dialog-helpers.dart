import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppDialogHelper {

  static ProgressDialog? pd;

  static void showProgressDialog(BuildContext context, String message){
    pd = ProgressDialog(context: context);

    pd!.show(
        msg: message,
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );
  }

  static void closeProgressDialog(){
    pd!.close();
  }

  static Future<void> showMyDialog(BuildContext context, String title, String message, {void Function()? callbackOk}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                // Ca fait un truc custom, ca appel une fonction
                callbackOk!();
              },
            ),
          ],
        );
      },
    );
  }
}