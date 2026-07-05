import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color background = Color(0xFF0D0D0F);

  static const Color glassSurface = Color(0x1AFFFFFF);
  static const Color glassSurfaceElevated = Color(0x26FFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);

  static const Color accentAmber = Color(0xFFF5A623);
  static const Color accentBlue = Color(0xFF4A9EF7);
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color accentAlert = Color(0xFFE53935);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xB3FFFFFF);
  static const Color textMuted = Color(0x80FFFFFF);

  static const TextStyle hero = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w300,
    height: 1.1,
    letterSpacing: -1.5,
    color: textPrimary,
  );

  static const TextStyle card = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.2,
    color: textMuted,
  );

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      surface: background,
      primary: accentBlue,
      secondary: accentAmber,
      tertiary: accentGreen,
      error: accentAlert,
      onSurface: textPrimary,
      onPrimary: textPrimary,
      onSecondary: background,
      onError: textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: title,
      ),
      cardTheme: CardThemeData(
        color: glassSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: glassBorder),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: hero,
        headlineMedium: card,
        titleMedium: title,
        bodyMedium: subtitle,
        labelSmall: caption,
      ),
      dividerColor: glassBorder,
      iconTheme: const IconThemeData(color: textSecondary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentBlue,
        foregroundColor: textPrimary,
      ),
    );
  }
}
