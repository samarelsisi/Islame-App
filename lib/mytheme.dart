import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appcolors.dart';

class MyTheme{
  static final ThemeData dartTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.primaryDarkColor,
      showSelectedLabels: true,),
   appBarTheme: AppBarTheme(
     backgroundColor: AppColors.primaryDarkColor,
     iconTheme: IconThemeData(
         color: AppColors.primaryColor
     ),
     centerTitle: true,
   ),
   textTheme: TextTheme(
  bodySmall: GoogleFonts.exo2(
  fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  ),
      bodyMedium: GoogleFonts.exo2(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color:AppColors.primaryColor ,
  ),
  bodyLarge: GoogleFonts.exo2(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryColor,
  ),
  titleSmall: GoogleFonts.elMessiri(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryColor,
  ),
  titleMedium: GoogleFonts.elMessiri(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryColor,
  ),
  titleLarge: GoogleFonts.elMessiri(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: AppColors.primaryColor,
  ),
  ),
  );
}