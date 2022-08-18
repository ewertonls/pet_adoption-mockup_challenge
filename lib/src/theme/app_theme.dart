import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.cyan,
      tertiary: AppColors.yellow,
      background: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.bodycolor,
      surfaceVariant: AppColors.lighterGray,
      onSurfaceVariant: AppColors.bodycolor,
      surfaceTint: AppColors.lightRed,
      inverseSurface: AppColors.bodycolor,
      onInverseSurface: AppColors.lightGray,
    ),
    disabledColor: AppColors.grey,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: AppColors.bodycolor,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      titleMedium: TextStyle(
        color: AppColors.bodycolor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.bodycolor,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: AppColors.bodycolor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w500,
        height: 1.8,
      ),
    ).apply(
      fontFamily: 'Inter',
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightGray,
    ),
  );
}
