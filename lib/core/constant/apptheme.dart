import 'package:flutter/material.dart';

import 'initialize_color.dart';

  ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      shape:  CircleBorder(),
    ),
    fontFamily: "Poppins",
    appBarTheme:const  AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.red,
      ),
      iconTheme: IconThemeData(
        color: Colors.red,
      )
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.colorTitle),
      bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.color,
          height: 1.7),
    ),
  );

  ThemeData themeArabic = ThemeData(
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      shape:  CircleBorder(),
    ),
   fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.red,
    ),
        iconTheme: IconThemeData(
          color: Colors.red,
        )
  ),
   textTheme: const TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.colorTitle),
    bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppColors.color,
        height: 1.7),
   ),
  );

