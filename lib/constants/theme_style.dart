import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData themeStyle() {
  return ThemeData(
    appBarTheme: appBarStyle(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    inputDecorationTheme: inputDecorationStyle(),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarStyle() {
  return AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    color: Colors.white,
  );
}

InputDecorationTheme inputDecorationStyle() {
  var outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: kTextColor),
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    focusedBorder: outlineBorder,
    border: outlineBorder,
    enabledBorder: outlineBorder,
  );
}
