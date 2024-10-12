import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

ThemeData lightMode = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  // fontFamily: "Roboto",
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
);
