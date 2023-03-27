import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IWorkFlowTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 23.0,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 17.5,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 20.5,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    )
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 14.0,
      color: Colors.white,
    )
  );

  static ThemeData appTheme1blue() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme2green() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme3red() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme4orange() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.orange,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme5pink() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.pinkAccent,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme6purple() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData appTheme7black() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
      ),
      textTheme: darkTextTheme,
    );
  }
}