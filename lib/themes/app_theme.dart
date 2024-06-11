import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF0FC3E8);
const Color _darkPrimary = Color(0xFF0C99B7);
const Color _mainColor = Color(0xFF193452);

const Color primaryColor = Color.fromRGBO(92, 107, 192, 1);
const Color _secondaryColor = Color.fromRGBO(156, 157, 204, 1.0);
const Color _accentColor = Color.fromRGBO(187, 222, 251, 1);
const Color _backgroundColor = Color.fromARGB(255, 255, 255, 255);

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      //primaryColor: _accentColor,
      colorSchemeSeed: primaryColor,
      scaffoldBackgroundColor: _backgroundColor,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    );
  }

  Color getPrimaryColor() {
    return primaryColor;
  }

  TextStyle titleStyle() {
    return const TextStyle(
        fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500);
  }

  TextStyle dataStyle() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }
}
