import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/weather_icon.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    required this.bundle,
    super.key,
  });

  final WeatherBundle bundle;

  @override
  Widget build(BuildContext context) {
    final current = bundle.current;
    final today = bundle.daily.days.isNotEmpty ? bundle.daily.days.first : null;

    return Column(
      children: [
        Text(bundle.cityName, style: AppTypography.title.copyWith(fontSize: 22)),
        const SizedBox(height: 4),
        Text(current.condition.label, style: AppTypography.subtitle),
        const SizedBox(height: AppSpacing.gap),
        WeatherIcon(condition: current.condition, size: 88),
        const SizedBox(height: AppSpacing.gap),
        Text(
          '${current.temperature.round()}°',
          style: AppTypography.hero,
        ),
        if (today != null) ...[
          const SizedBox(height: 4),
          Text(
            'H:${today.tempMax.round()}° L:${today.tempMin.round()}°',
            style: AppTypography.subtitle,
          ),
        ],
      ],
    );
  }
}
