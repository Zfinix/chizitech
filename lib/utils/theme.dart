import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0XFF2C54D8);

Color accent([bool isDark = false]) =>
    isDark ? Color(0xFF00A86D) : Color.fromARGB(255, 173, 3, 65);

const Color alt = Color(0xffE4B36B);

Color bgColor([bool isDark = false]) =>
    isDark ? Color.fromARGB(255, 3, 34, 29) : Color(0xffF6F6F6);

const Color red = Color(0xFFD82C68);

const Color white = Colors.white;

const Color black = Colors.black;

Color textColor([bool isDark = false]) => isDark ? white : black;

Color buttonColor([bool isDark = false]) =>
    isDark ? accent(isDark) : Color(0xFF00A86D);

Color buttonTextColor([bool isDark = false]) => isDark ? white : accent();

const Color grey = Colors.grey;

themeData(context) => ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

darkThemeData(context) => ThemeData.dark().copyWith(
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
