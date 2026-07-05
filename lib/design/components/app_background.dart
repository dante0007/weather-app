import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';

/// Atmospheric gradient backdrop behind every screen.
class AppBackground extends StatelessWidget {
  const AppBackground({
    required this.child,
    super.key,
    this.showGlow = true,
  });

  final Widget child;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (showGlow) ...[
            Positioned(
              top: -80,
              right: -40,
              child: _glow(AppColors.accentBlue.withValues(alpha: 0.12)),
            ),
            Positioned(
              bottom: 120,
              left: -60,
              child: _glow(AppColors.accentAmber.withValues(alpha: 0.08)),
            ),
          ],
          child,
        ],
      ),
    );
  }

  Widget _glow(Color color) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}
