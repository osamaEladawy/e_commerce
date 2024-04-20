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

  ThemeData themeEnglishDark = ThemeData.dark().copyWith(
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      shape:  CircleBorder(),
    ),
    //fontFamily: "Poppins",
    //scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

    ),
    bottomAppBarTheme: BottomAppBarTheme(
      padding: const EdgeInsets.all(10),
      elevation: 0.5,
      height: 64,
      shape: const CircularNotchedRectangle(),
      //notchMargin: 8,
      color: Colors.grey[200],
    ),
    appBarTheme:const  AppBarTheme(
     // backgroundColor: Colors.black,
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

  ThemeData themeArabicDark = ThemeData.dark().copyWith(
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape:  CircleBorder(),
      ),
      //scaffoldBackgroundColor: Colors.black,
      bottomAppBarTheme: BottomAppBarTheme(
        padding: const EdgeInsets.all(10),
        elevation: 0.5,
        height: 64,
        shape: const CircularNotchedRectangle(),
        //notchMargin: 8,
        color: Colors.grey[200],
      ),
     // fontFamily: "Cairo",
      appBarTheme: const AppBarTheme(
       // backgroundColor: Colors.black,
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
      )
  );

