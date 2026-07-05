import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';

/// Kill-switch status dot (green = active, red = killed).
class KillSwitchIndicator extends StatelessWidget {
  const KillSwitchIndicator({
    required this.isKilled,
    super.key,
    this.size = 10,
  });

  final bool isKilled;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = isKilled ? AppColors.accentAlert : AppColors.accentGreen;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.45),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
