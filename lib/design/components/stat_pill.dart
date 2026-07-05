import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/glass_card.dart';

/// Quick-stat pill for precip / humidity / wind rows.
class StatPill extends StatelessWidget {
  const StatPill({
    required this.icon,
    required this.value,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.gap,
        vertical: AppSpacing.padding,
      ),
      borderRadius: AppRadii.cardLg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(height: AppSpacing.gapSm),
          Text(value, style: AppTypography.temp.copyWith(fontSize: 20)),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: AppTypography.caption.copyWith(letterSpacing: 0.8),
          ),
        ],
      ),
    );
  }
}
