import 'package:flutter/material.dart';

import 'palette.dart';

final portfolioInputs = InputDecorationTheme(
  filled: true,
  fillColor: Palette.panel2,
  isDense: true,
  prefixIconColor: const Color(0xFFEFE7FF),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: const BorderSide(color: Palette.border),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: const BorderSide(color: Palette.border),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: const BorderSide(color: Palette.violet),
  ),
);

final portfolioButtons = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Palette.purple,
    foregroundColor: Colors.white,
    minimumSize: const Size(0, 42),
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    textStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

final portfolioOutlines = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    side: const BorderSide(color: Color(0xFF9C8CAB)),
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
