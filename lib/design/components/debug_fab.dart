import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';

/// Glassmorphic gear FAB with a subtle glow (design 08).
class DebugFab extends StatelessWidget {
  const DebugFab({
    required this.onPressed,
    super.key,
    this.highlighted = true,
  });

  final VoidCallback onPressed;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadii.card,
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: AppColors.accentBlue.withValues(alpha: 0.5),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: AppRadii.card,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Material(
            color: AppColors.glassSurfaceElevated,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: AppRadii.card,
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: const Icon(
                  Icons.settings,
                  color: AppColors.textPrimary,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
