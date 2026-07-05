import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_typography.dart';

/// Green ON / red OFF pill used in the debug flag table.
class OnOffBadge extends StatelessWidget {
  const OnOffBadge({
    required this.isOn,
    super.key,
  });

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    final color = isOn ? AppColors.accentGreen : AppColors.accentAlert;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: AppRadii.pill,
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      child: Text(
        isOn ? 'ON' : 'OFF',
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
