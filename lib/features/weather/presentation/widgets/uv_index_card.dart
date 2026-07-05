import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/circular_metric_gauge.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/design/components/status_badge.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class UvIndexCard extends StatelessWidget {
  const UvIndexCard({
    required this.bundle,
    required this.detailed,
    super.key,
  });

  final WeatherBundle bundle;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final uv = bundle.current.uvIndex.round();
    final level = uv >= 6 ? 'HIGH' : 'MODERATE';
    final color = uv >= 6 ? AppColors.accentAmber : AppColors.accentGreen;

    final gaugeSize = detailed ? 76.0 : 64.0;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircularMetricGauge(
                value: uv.toDouble(),
                max: 11,
                color: color,
                displayValue: '$uv',
                size: gaugeSize,
                style: GaugeStyle.arc,
              ),
              const SizedBox(width: AppSpacing.gap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('UV Index', style: AppTypography.title),
                        const SizedBox(width: 8),
                        StatusBadge(label: level, color: color),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      detailed
                          ? 'Apply sunscreen before going out.'
                          : 'Moderate exposure risk',
                      style: AppTypography.subtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (detailed) ...[
            const SizedBox(height: AppSpacing.gapSm),
            Text(
              'Peak 1–3 PM · Max today · 8',
              style: AppTypography.caption,
            ),
          ],
        ],
      ),
    );
  }
}
