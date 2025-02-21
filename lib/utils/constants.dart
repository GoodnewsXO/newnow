import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2ABAFF);
const kHeadingColor = Color(0xFF1A1A1A);
const kTextColor = Color(0xFF999999);
const kTextMediumColor = Color(0xFF2d2d2d);
const kStrokeColor = Color(0xFFEDEDED);

final ThemeData appTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'SoruceSansPro',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: kHeadingColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.red,
  ),
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: kTextMediumColor),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: kStrokeColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kStrokeColor),
    ),
    labelStyle: TextStyle(color: kTextColor),
  ),
  dividerColor: kStrokeColor,
);
