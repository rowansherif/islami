import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyAppTheme {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDark,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryDark)));
}
