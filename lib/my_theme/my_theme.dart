import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const Color primaryColor = Color(0XFF5D9CEC);
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color blackColor = Color(0XFF363636);
  static const Color greenColor = Color(0XFF61E757);
  static const Color redColor = Color(0XFFEC4B4B);
  static const Color bgColor = Color(0XFFDFECDB);
  static const Color darkBgColor = Color(0XFF060E1E);
  static const Color darkSecondBgColor = Color(0XFF141922);
  static const Color greyColor = Color(0XFFC8C9CB);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bgColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: const BorderSide(color: whiteColor, width: 4))),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: whiteColor,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBgColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: const BorderSide(color: darkSecondBgColor, width: 4))),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: darkSecondBgColor,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryColor,
      unselectedItemColor: whiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
    ),
  );
}
