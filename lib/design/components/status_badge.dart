import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_typography.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    required this.label,
    required this.color,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: AppRadii.pill,
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
