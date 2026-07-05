import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_typography.dart';

export 'package:weather_app/core/theme/app_colors.dart';
export 'package:weather_app/core/theme/app_radii.dart';
export 'package:weather_app/core/theme/app_spacing.dart';
export 'package:weather_app/core/theme/app_typography.dart';

abstract final class AppTheme {
  // Back-compat aliases used by existing widgets.
  static const Color background = AppColors.backgroundTop;
  static const Color glassSurface = AppColors.glassSurface;
  static const Color glassSurfaceElevated = AppColors.glassSurfaceElevated;
  static const Color glassBorder = AppColors.glassBorder;
  static const Color accentAmber = AppColors.accentAmber;
  static const Color accentBlue = AppColors.accentBlue;
  static const Color accentGreen = AppColors.accentGreen;
  static const Color accentAlert = AppColors.accentAlert;
  static const Color textPrimary = AppColors.textPrimary;
  static const Color textSecondary = AppColors.textSecondary;
  static const Color textMuted = AppColors.textMuted;

  static const TextStyle hero = AppTypography.hero;
  static const TextStyle card = AppTypography.temp;
  static const TextStyle title = AppTypography.title;
  static const TextStyle subtitle = AppTypography.subtitle;
  static const TextStyle caption = AppTypography.caption;

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      surface: AppColors.backgroundTop,
      primary: AppColors.accentBlue,
      secondary: AppColors.accentAmber,
      tertiary: AppColors.accentGreen,
      error: AppColors.accentAlert,
      onSurface: AppColors.textPrimary,
      onPrimary: AppColors.textPrimary,
      onSecondary: AppColors.backgroundTop,
      onError: AppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundTop,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.title,
      ),
      cardTheme: CardThemeData(
        color: AppColors.glassSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.card,
          side: const BorderSide(color: AppColors.glassBorder),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTypography.hero,
        headlineMedium: AppTypography.temp,
        titleMedium: AppTypography.title,
        bodyMedium: AppTypography.subtitle,
        labelSmall: AppTypography.caption,
      ),
      dividerColor: AppColors.glassBorder,
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentBlue,
        foregroundColor: AppColors.textPrimary,
      ),
    );
  }
}
