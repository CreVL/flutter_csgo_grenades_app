import 'package:csgo_grenades/theme/app_colors.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.blackColor,
  dividerColor: AppColors.blackColor,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w700,
          fontSize: 20)),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w700)),
);
