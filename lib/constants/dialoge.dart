import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog showDialogeMethod(BuildContext context, String message) {
  final size = MediaQuery.of(context).size;
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    title: 'Error',
    desc: message,
    body: Column(
      children: [
        Text(
          'Error',
          style: TextStyle(color: Colors.black, fontSize: size.height * 0.03),
        ),
        Text(
          message,
          style: TextStyle(color: Colors.red, fontSize: size.height * 0.02),
        )
      ],
    ),
    btnOkOnPress: () => Navigator.of(context).focusScopeNode,
    padding: EdgeInsets.all(20),
    showCloseIcon: true,
  )..show();
}
