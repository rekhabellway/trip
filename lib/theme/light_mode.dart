import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xdffffff),
  primaryColor: const Color(0xff8b1ca4),
  canvasColor: const Color(0xffffffff),
  secondaryHeaderColor: const Color(0xff1ca45b),
  disabledColor: const Color(0xffada9a2),
  brightness: Brightness.light,
  hintColor: const Color(0x892196f3),
  cardColor: const Color(0xff28335b),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF01509b),
    ),
  ),
  textTheme: GoogleFonts.quicksandTextTheme(),
);
