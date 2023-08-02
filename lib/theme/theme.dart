import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  primarySwatch: Colors.amber,
  dividerColor: Colors.black,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20)),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w700)),
);
