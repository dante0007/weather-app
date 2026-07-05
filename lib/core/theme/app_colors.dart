import 'package:flutter/material.dart';

/// Design color tokens from `Weather States_compressed.pdf`.
abstract final class AppColors {
  static const Color backgroundTop = Color(0xFF0D0D0F);
  static const Color backgroundBottom = Color(0xFF1A1A2E);

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

  static const Color onBadge = Color(0xFF0D0D0F);
  static const Color offBadge = Color(0xFFFFFFFF);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundTop, backgroundBottom],
  );

  static const LinearGradient alertGradient = LinearGradient(
    colors: [Color(0xFFE53935), Color(0xFFFF7043)],
  );
}
