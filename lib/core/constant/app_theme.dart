import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class AppTheme {
  // ------------------ LIGHT THEME ------------------
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryColor,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.white,
      onSurface: AppColors.textPrimary,
      error: AppColors.errorColor,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textSecondary),
    ),
  );

  // ------------------ DARK THEME ------------------
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.backgroundDarkPrimary,
    primaryColor: AppColors.accentBlueDark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accentBlueDark,
      brightness: Brightness.dark,
      primary: AppColors.accentBlueDark,
      secondary: AppColors.accentPurpleDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textDarkPrimary,
      error: AppColors.errorColor,
      surfaceContainerHighest: AppColors.surfaceDarkElevated,
      outline: AppColors.borderDark,
    ),

    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.dividerDark,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.textDarkPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textDarkSecondary),
      bodySmall: TextStyle(fontSize: 14, color: AppColors.textDarkHint),
    ),

    iconTheme: const IconThemeData(color: AppColors.textDarkPrimary),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDarkSecondary,
      foregroundColor: AppColors.textDarkPrimary,
      elevation: 0,
    ),
  );
}
