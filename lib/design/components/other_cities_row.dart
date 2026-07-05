import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/design/components/weather_icon.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/static/static_mock_data.dart';

class OtherCitiesRow extends StatelessWidget {
  const OtherCitiesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Other Cities', style: AppTypography.title),
            const Spacer(),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.glassSurface,
                borderRadius: AppRadii.pill,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.add, size: 16, color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.gap),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: StaticMockData.otherCityBundles.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSpacing.gap),
            itemBuilder: (context, index) {
              return _CityCard(bundle: StaticMockData.otherCityBundles[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({required this.bundle});

  final WeatherBundle bundle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: GlassCard(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bundle.cityName, style: AppTypography.subtitle),
            Text(
              bundle.current.condition.label,
              style: AppTypography.caption,
            ),
            const Spacer(),
            Row(
              children: [
                WeatherIcon(condition: bundle.current.condition, size: 28),
                const Spacer(),
                Text(
                  '${bundle.current.temperature.round()}°',
                  style: AppTypography.temp.copyWith(fontSize: 22),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
