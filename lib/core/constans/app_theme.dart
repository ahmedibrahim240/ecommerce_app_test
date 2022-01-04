import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  static final DatePickerTheme datePickerTheme = DatePickerTheme(
    cancelStyle: const TextStyle(color: Colors.white, fontSize: 16),
    doneStyle: const TextStyle(color: Colors.blueAccent, fontSize: 16),
    itemStyle: const TextStyle(color: Colors.white, fontSize: 18),
    backgroundColor: Colors.black54,
    headerColor: kPrimaryColor,
    containerHeight: 210.0,
    titleHeight: 44.0,
    itemHeight: 36.0,
  );
}
