import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/circular_metric_gauge.dart';
import 'package:weather_app/core/widgets/glass_card.dart';
import 'package:weather_app/core/widgets/status_badge.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({
    required this.bundle,
    required this.detailed,
    super.key,
  });

  final WeatherBundle bundle;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final air = bundle.airQuality;
    final label = switch (air.category) {
      AirQualityCategory.good => 'GOOD',
      AirQualityCategory.moderate => 'MODERATE',
      _ => 'POOR',
    };

    final gaugeSize = detailed ? 76.0 : 64.0;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircularMetricGauge(
                value: air.aqi.toDouble(),
                max: 150,
                color: AppColors.accentGreen,
                displayValue: '${air.aqi}',
                size: gaugeSize,
                style: detailed ? GaugeStyle.ring : GaugeStyle.arc,
              ),
              const SizedBox(width: AppSpacing.gap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Air Quality', style: AppTypography.title),
                        const SizedBox(width: 8),
                        StatusBadge(label: label, color: AppColors.accentGreen),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Dominant pollutant · ${air.dominantPollutant}',
                      style: AppTypography.subtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (detailed) ...[
            const SizedBox(height: AppSpacing.gapSm),
            const Text('O₃ · 18   NO₂ · 9', style: AppTypography.caption),
          ],
        ],
      ),
    );
  }
}
