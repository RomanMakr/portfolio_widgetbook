import 'package:flutter/material.dart';

import 'theme_parts.dart';
export 'palette.dart';

ThemeData portfolioTheme() => ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Palette.bg,
  colorScheme: const ColorScheme.dark(
    primary: Palette.purple,
    secondary: Palette.violet,
    surface: Palette.panel,
  ),
  dividerColor: Palette.border,
  dividerTheme: const DividerThemeData(color: Palette.border),
  inputDecorationTheme: portfolioInputs,
  elevatedButtonTheme: portfolioButtons,
  outlinedButtonTheme: portfolioOutlines,
  appBarTheme: const AppBarTheme(
    backgroundColor: Palette.bg,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Palette.panel2,
    side: const BorderSide(color: Palette.border),
    labelStyle: const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 12,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  switchTheme: const SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(Colors.white),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: const WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w800,
      height: 1.08,
      letterSpacing: -1.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      height: 1.15,
    ),
    titleLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 14, height: 1.4),
  ),
);
