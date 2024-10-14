// theme_dark.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(), // Set default font
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF121212), // Dark surface color
    primary: const Color(0xFFBB86FC), // Dark primary color
    secondary: const Color(0xFF03DAC6), // Dark secondary color
    inversePrimary: Colors.white, // Inverse primary color for contrast
  ),
);
