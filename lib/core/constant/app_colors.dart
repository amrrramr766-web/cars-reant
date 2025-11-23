import 'package:flutter/material.dart';

/// Centralized color palette for the car rental app
class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF007AFF); // Deep Purple
  static const Color primaryLight = Color(0xFFEDE9FE); // Light Purple
  static const Color primaryDark = Color(0xFF0051D5); // Dark Purple

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF007AFF); // iOS Blue
  static const Color secondaryLight = Color(0xFFEEF5FF); // Light Blue
  static const Color secondaryDark = Color(0xFF0051D5); // Dark Blue

  // Accent Colors
  static const Color accentRed = Color(0xFFEF4444);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentYellow = Color(0xFFFCD34D);
  static const Color accentOrange = Color(0xFFF97316);

  // Neutral Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F5F7);
  static const Color backgroundLighter = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFEEEEF0);

  // Border & Divider Colors
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color dividerColor = Color(0xFFD1D5DB);
  static const Color borderLight = Color(0xFFF3F4F6);

  // State Colors
  static const Color successColor = Color(0xFF10B981);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color infoColor = Color(0xFF3B82F6);

  // Disabled Colors
  static const Color disabledColor = Color(0xFFD1D5DB);
  static const Color disabledBackground = Color(0xFFF9FAFB);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryColor, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Opacity helpers
  static Color primaryWithOpacity(double opacity) =>
      primaryColor.withOpacity(opacity);
  static Color secondaryWithOpacity(double opacity) =>
      secondaryColor.withOpacity(opacity);
  static Color textPrimaryWithOpacity(double opacity) =>
      textPrimary.withOpacity(opacity);
  static Color whiteWithOpacity(double opacity) => white.withOpacity(opacity);
  static Color blackWithOpacity(double opacity) => black.withOpacity(opacity);

  // Shades for flexibility
  static const Map<int, Color> primaryShades = {
    50: Color(0xFFFAF5FF),
    100: Color(0xFFF3E8FF),
    200: Color(0xFFE9D5FF),
    300: Color(0xFFD8B4FE),
    400: Color(0xFFC084FC),
    500: Color(0xFFA855F7),
    600: Color(0xFF9333EA),
    700: Color(0xFF7E22CE),
    800: Color(0xFF6B21B6),
    900: Color(0xFF581C87),
  };

  static const Map<int, Color> greyShades = {
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  };
}
