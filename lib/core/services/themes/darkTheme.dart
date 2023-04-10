// ignore_for_file: file_names

import 'package:ecommerce_app/constance.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color.fromARGB(221, 17, 16, 16),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: Colors.white38,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.grey,
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
