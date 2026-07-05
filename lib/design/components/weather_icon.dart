import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

/// Maps [WeatherCondition] to a stylized icon cluster.
///
/// **Icon choice:** Material Symbols (built into Flutter) composed in a
/// [Stack] with accent fills to approximate the illustrated sun/cloud look
/// from the design file. Custom SVG assets can replace this widget later
/// without changing call sites.
class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    required this.condition,
    super.key,
    this.size = 72,
  });

  final WeatherCondition condition;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: _buildIcon(condition),
    );
  }

  Widget _buildIcon(WeatherCondition condition) {
    return switch (condition.type) {
      WeatherConditionType.clear => _sun(size * 0.9),
      WeatherConditionType.partlyCloudy => Stack(
          alignment: Alignment.center,
          children: [
            _sun(size * 0.55, alignment: const Alignment(-0.35, -0.35)),
            _cloud(size * 0.75, alignment: Alignment.bottomRight),
          ],
        ),
      WeatherConditionType.cloudy => _cloud(size * 0.85),
      WeatherConditionType.fog => Icon(
          Icons.foggy,
          size: size * 0.8,
          color: AppColors.textSecondary,
        ),
      WeatherConditionType.drizzle ||
      WeatherConditionType.rain ||
      WeatherConditionType.rainShowers =>
        Stack(
          alignment: Alignment.center,
          children: [
            _cloud(size * 0.7, alignment: const Alignment(0, -0.2)),
            Icon(
              Icons.water_drop,
              size: size * 0.28,
              color: AppColors.accentBlue,
            ),
          ],
        ),
      WeatherConditionType.freezingRain => Stack(
          alignment: Alignment.center,
          children: [
            _cloud(size * 0.7),
            Icon(
              Icons.ac_unit,
              size: size * 0.28,
              color: AppColors.accentBlue,
            ),
          ],
        ),
      WeatherConditionType.snow ||
      WeatherConditionType.snowShowers =>
        Stack(
          alignment: Alignment.center,
          children: [
            _cloud(size * 0.7, alignment: const Alignment(0, -0.15)),
            Icon(
              Icons.ac_unit,
              size: size * 0.32,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      WeatherConditionType.thunderstorm => Stack(
          alignment: Alignment.center,
          children: [
            _cloud(size * 0.72, alignment: const Alignment(0, -0.2)),
            Icon(
              Icons.flash_on,
              size: size * 0.34,
              color: AppColors.accentAmber,
            ),
          ],
        ),
      WeatherConditionType.unknown => Icon(
          Icons.help_outline,
          size: size * 0.7,
          color: AppColors.textMuted,
        ),
    };
  }

  Widget _sun(double diameter, {Alignment alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Color(0xFFFFE082), AppColors.accentAmber],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x44F5A623),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cloud(double diameter, {Alignment alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: Icon(
        Icons.cloud,
        size: diameter,
        color: AppColors.textPrimary.withValues(alpha: 0.92),
      ),
    );
  }
}
