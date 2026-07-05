import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';

/// Kill-switch status dot (green = active, red = killed).
class KillSwitchIndicator extends StatelessWidget {
  const KillSwitchIndicator({
    required this.isKilled,
    super.key,
    this.size = 10,
    this.onTap,
  });

  final bool isKilled;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isKilled ? AppColors.accentAlert : AppColors.accentGreen;

    final dot = Container(
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

    if (onTap == null) {
      return dot;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: dot,
      ),
    );
  }
}
