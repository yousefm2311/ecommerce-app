// ignore_for_file: file_names

import 'package:ecommerce_app/constance.dart';
import 'package:flutter/material.dart';

class LightTheme {
  ThemeData customLightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black45,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    ),
  );
}
