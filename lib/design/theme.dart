import 'package:flutter/material.dart';

class Palette {
  static const bg = Color(0xFF0D0B24);
  static const panel = Color(0xFF191534);
  static const panel2 = Color(0xFF242044);
  static const purple = Color(0xFF8D27FF);
  static const violet = Color(0xFFB960FF);
  static const border = Color(0xFF51417C);
  static const muted = Color(0xFFB9B2D4);
}

ThemeData portfolioTheme() => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Palette.bg,
  colorScheme: const ColorScheme.dark(primary: Palette.purple, surface: Palette.panel),
  inputDecorationTheme: InputDecorationTheme(
    filled: true, fillColor: Palette.panel2,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Palette.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Palette.border)),
  ),
  cardTheme: CardThemeData(color: Palette.panel, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Palette.border))),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Palette.purple, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
  textTheme: const TextTheme(headlineLarge: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, height: 1.1), headlineMedium: TextStyle(fontSize: 29, fontWeight: FontWeight.w800), titleLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.bold), bodyMedium: TextStyle(fontSize: 14)),
);