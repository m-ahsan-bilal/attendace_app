// theme_light.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(), // Set default font
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFFFFFFF), // Light surface color
    primary: const Color(0xFF6200EA), // Light primary color
    secondary: const Color(0xFF03DAC6), // Light secondary color
    inversePrimary: Colors.black, // Inverse primary color for contrast
  ),
);
