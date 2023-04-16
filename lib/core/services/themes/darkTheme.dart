// ignore_for_file: file_names

import 'package:ecommerce_app/constance.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color.fromARGB(221, 17, 16, 16),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white70,
        height: 2,
        fontSize: 14,
      ),
      headlineLarge: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontFamily: 'SourceSansPro',
        fontSize: 30.0,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.white70,
        fontFamily: 'SourceSansPro',
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Colors.white38,
        fontFamily: 'SourceSansPro',
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.grey,
        fontFamily: 'SourceSansPro',
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color.fromARGB(221, 17, 16, 16),
    ),
  );
}
