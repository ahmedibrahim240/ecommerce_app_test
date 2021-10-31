import 'package:flutter/material.dart';

import 'constans.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black54,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white12,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: kPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        subtitle2: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
