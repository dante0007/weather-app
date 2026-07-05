import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_typography.dart';

enum GaugeStyle {
  /// Partial arc used for UV index (design detailed variant).
  arc,

  /// Full ring used for air quality (design detailed variant).
  ring,
}

class CircularMetricGauge extends StatelessWidget {
  const CircularMetricGauge({
    required this.value,
    required this.max,
    required this.color,
    required this.displayValue,
    super.key,
    this.size = 64,
    this.style = GaugeStyle.arc,
  });

  final double value;
  final double max;
  final Color color;
  final String displayValue;
  final double size;
  final GaugeStyle style;

  @override
  Widget build(BuildContext context) {
    final progress = (value / max).clamp(0.0, 1.0);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GaugePainter(
          progress: progress,
          color: color,
          style: style,
        ),
        child: Center(
          child: Text(
            displayValue,
            style: AppTypography.title.copyWith(
              fontSize: size * 0.28,
            ),
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.progress,
    required this.color,
    required this.style,
  });

  final double progress;
  final Color color;
  final GaugeStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.09;
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(stroke / 2);

    final track = Paint()
      ..color = AppColors.glassBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    if (style == GaugeStyle.ring) {
      canvas.drawCircle(arcRect.center, arcRect.width / 2, track);
      canvas.drawArc(
        arcRect,
        -math.pi / 2,
        math.pi * 2 * progress,
        false,
        fill,
      );
      return;
    }

    const start = math.pi * 0.75;
    const sweep = math.pi * 1.5;
    canvas.drawArc(arcRect, start, sweep, false, track);
    canvas.drawArc(arcRect, start, sweep * progress, false, fill);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.style != style;
  }
}
