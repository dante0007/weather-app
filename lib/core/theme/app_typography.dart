import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';

/// Text style scale from the design file.
abstract final class AppTypography {
  static const TextStyle hero = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w300,
    height: 1.1,
    letterSpacing: -1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle temp = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.2,
    color: AppColors.textMuted,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 1.2,
    color: AppColors.textMuted,
  );
}
