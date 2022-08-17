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
      surface: AppColors.white,
      onSurface: AppColors.bodycolor,
      surfaceVariant: AppColors.lighterGray,
      onSurfaceVariant: AppColors.bodycolor,
    ),
    disabledColor: AppColors.grey,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.bodycolor,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightText,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: AppColors.bodycolor,
        fontSize: 12,
      ),
    ).apply(),
    iconTheme: const IconThemeData(
      color: AppColors.lightGray,
    ),
  );
}
