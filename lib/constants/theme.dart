import 'package:flutter/material.dart';

// This theme will apply throughout the whole app.
// More information in flutter.dev design&Theming

ThemeData themeData = ThemeData(
  //background for app's user interface
  scaffoldBackgroundColor: Colors.white,

  //Elevated Buttion Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      disabledBackgroundColor: const Color.fromRGBO(158, 158, 158, 1),
      textStyle: const TextStyle(
        fontSize: 18.0,
      ),
    ),
  ),

  //Text Form Field
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(2.0))),
  ),

  //outline button theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.red,
        width: 3.0,
      ),
      textStyle: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    ),
  ),

  //appbar theme
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
);
