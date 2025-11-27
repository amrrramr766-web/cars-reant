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

  // Additional Colors
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color blueAccent = Colors.blueAccent;
  static const Color blueGrey = Colors.blueGrey;

  // Specific Shades
  static final Color red100 = Colors.red.shade100;
  static final Color red600 = Colors.red.shade600;
  static final Color red700 = Colors.red.shade700;
  static final Color green700 = Colors.green.shade700;
  static final Color grey700 = Colors.grey.shade700;
  static final Color blue700 = Colors.blue.shade700;
  static final Color blue100 = Colors.blue.shade100;
  static final Color blueGrey50 = Colors.blueGrey.shade50;
  static final Color deepPurpleAccent400 = Colors.deepPurpleAccent.shade400;
  static const Color deepPurple = Colors.deepPurple;
  static final Color deepPurple900 = Colors.deepPurple.shade900;
  static final Color deepPurple200 = Colors.deepPurple.shade200;
  static final Color deepPurple50 = Colors.deepPurple.shade50;
  static final Color grey300 = Colors.grey.shade300;
  static final Color grey400 = Colors.grey.shade400;
  static const Color black12 = Colors.black12;
  static const Color amber = Colors.amber;
  static const Color primaryBlue = Color(0xFF0B95DA);
  static const Color greySecondary = Color(0xFF6C757D);
  static const Color backgroundDark = Color(0xFF101C22);
  static const Color backgroundLightAlt = Color(0xFFF5F7F8);

  // Custom Colors
  static const Color darkPurple = Color(
    0xFF0F0127,
  ); // Used in car item card button

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
