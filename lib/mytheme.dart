import 'package:flutter/material.dart';

import 'appcolors.dart';

class MyTheme{
  static final ThemeData dartTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.primaryDarkColor,
      showSelectedLabels: true,
    )
  );
}