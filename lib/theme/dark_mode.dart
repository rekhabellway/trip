import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xfff1f5ff),
  primaryColor: const Color(0xdffffff),
  canvasColor: const Color(0x24ffffff),
  secondaryHeaderColor: const Color(0x52ffffff),
  disabledColor: const Color(0xffa2a7ad),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: const Color(0x7eafa6a6),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0x42ffffff),
    ),
  ),
  textTheme: GoogleFonts.quicksandTextTheme(),
);
