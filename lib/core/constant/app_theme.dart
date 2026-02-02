import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // ------------------ SCHEMES ------------------
  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: AppColors.accentBlueDark,
    brightness: Brightness.dark,
    surfaceContainerHighest: AppColors.surfaceDarkElevated,
    outline: AppColors.borderDark,
  );

  // ------------------ LIGHT THEME ------------------
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: _lightScheme,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
    ),
  );

  // ------------------ DARK THEME ------------------
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.backgroundDarkPrimary,
    colorScheme: _darkScheme,

    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.dividerDark,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textDarkSecondary),
      bodySmall: TextStyle(fontSize: 14, color: AppColors.textDarkHint),
    ),

    iconTheme: IconThemeData(color: _darkScheme.onSurface),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDarkSecondary,
      foregroundColor: AppColors.textDarkPrimary,
      elevation: 0,
    ),
  );
}
