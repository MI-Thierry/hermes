import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Color.fromARGB(0xff, 0x0, 0x4c, 0xff),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(0xff, 0x0, 0x4c, 0xff),
    onPrimary: Color.fromARGB(0xff, 0x0f3, 0xf3, 0xf3),
    secondary: Color.fromARGB(0xff, 0x20, 0x20, 0x20),
    onSecondary: Color.fromARGB(0xff, 0xf3, 0xf3, 0xf3),
    error: Color.fromARGB(0xff, 0xe4, 0x4e, 0x4e),
    onError: Color.fromARGB(0xff, 0xff, 0xff, 0xff),
    surface: Color.fromARGB(0xff, 0xf1, 0xf4, 0xfe),
    onSurface: Color.fromARGB(0xff, 0x20, 0x20, 0x20),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.raleway(fontSize: 52, fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.raleway(fontSize: 28, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.raleway(fontSize: 21, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.nunitoSans(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: GoogleFonts.nunitoSans(fontSize: 14),
    bodySmall: GoogleFonts.nunitoSans(fontSize: 10),
    labelLarge: GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: GoogleFonts.nunitoSans(
      fontSize: 15,
      fontWeight: FontWeight.w300,
    ),
  ),
);
