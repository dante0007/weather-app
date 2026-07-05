import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/glass_card.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class WindSpeedCard extends StatelessWidget {
  const WindSpeedCard({
    required this.bundle,
    required this.detailed,
    super.key,
  });

  final WeatherBundle bundle;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final speed = detailed ? 12.0 : bundle.current.windSpeed;
    final direction = bundle.current.windDirection;

    return GlassCard(
      child: Row(
        children: [
          _Compass(
            directionDegrees: direction.toDouble(),
            size: detailed ? 76 : 64,
            detailed: detailed,
          ),
          const SizedBox(width: AppSpacing.gap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Wind Speed', style: AppTypography.title),
                const SizedBox(height: 4),
                Text(
                  '${speed.round()} km/h',
                  style: AppTypography.temp.copyWith(fontSize: detailed ? 28 : 24),
                ),
                if (detailed)
                  const Text(
                    'Gusts up to 20 km/h',
                    style: AppTypography.subtitle,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Compass extends StatelessWidget {
  const _Compass({
    required this.directionDegrees,
    required this.size,
    required this.detailed,
  });

  final double directionDegrees;
  final double size;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final label = _directionLabel(directionDegrees);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (detailed)
            CustomPaint(
              size: Size.square(size),
              painter: _CompassTicksPainter(),
            ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentBlue.withValues(alpha: 0.15),
              border: Border.all(color: AppColors.glassBorder),
            ),
          ),
          Transform.rotate(
            angle: (directionDegrees - 90) * math.pi / 180,
            child: Icon(
              Icons.navigation,
              color: AppColors.accentBlue,
              size: size * 0.42,
            ),
          ),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: detailed ? 11 : 10,
            ),
          ),
        ],
      ),
    );
  }

  String _directionLabel(double degrees) {
    const labels = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final index = ((degrees + 22.5) % 360 / 45).floor();
    return labels[index];
  }
}

class _CompassTicksPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 4;
    final paint = Paint()
      ..color = AppColors.textMuted
      ..strokeWidth = 1;

    for (var i = 0; i < 8; i++) {
      final angle = (i * math.pi / 4) - math.pi / 2;
      final inner = radius - (i.isEven ? 8 : 4);
      final outer = radius - 1;
      final start = Offset(
        center.dx + inner * math.cos(angle),
        center.dy + inner * math.sin(angle),
      );
      final end = Offset(
        center.dx + outer * math.cos(angle),
        center.dy + outer * math.sin(angle),
      );
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
