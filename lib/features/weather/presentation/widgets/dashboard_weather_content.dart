import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/design/components/stat_pill.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/feature_gate.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/variant_builder.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/presentation/widgets/air_quality_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_forecast_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/other_cities.dart';
import 'package:weather_app/features/weather/presentation/widgets/uv_index_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/wind_speed_card.dart';

class DashboardWeatherContent extends StatelessWidget {
  const DashboardWeatherContent({
    required this.bundle,
    super.key,
  });

  final WeatherBundle bundle;

  @override
  Widget build(BuildContext context) {
    final current = bundle.current;

    return FlagVariant(
      flagKey: 'layout_variant',
      builder: (context, variant) {
        final detailed = variant == 'detailed';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: StatPill(
                    icon: Icons.grain,
                    value: '${current.precipitationProbability.round()}%',
                    label: 'Precip',
                  ),
                ),
                const SizedBox(width: AppSpacing.gap),
                Expanded(
                  child: StatPill(
                    icon: Icons.water_drop_outlined,
                    value: '${current.humidity}%',
                    label: 'Humidity',
                  ),
                ),
                const SizedBox(width: AppSpacing.gap),
                Expanded(
                  child: StatPill(
                    icon: Icons.air,
                    value: '${current.windSpeed.round()}km/h',
                    label: 'Wind',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.gap),
            FeatureGate(
              flagKey: 'uv_index_card',
              builder: (_) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.gap),
                child: UvIndexCard(bundle: bundle, detailed: detailed),
              ),
            ),
            FeatureGate(
              flagKey: 'air_quality_card',
              builder: (_) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.gap),
                child: AirQualityCard(bundle: bundle, detailed: detailed),
              ),
            ),
            FeatureGate(
              flagKey: 'wind_speed_card',
              builder: (_) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.gap),
                child: WindSpeedCard(bundle: bundle, detailed: detailed),
              ),
            ),
            FeatureGate(
              flagKey: 'hourly_forecast',
              builder: (_) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.gap),
                child: HourlyForecastCard(bundle: bundle, detailed: detailed),
              ),
            ),
            if (!detailed)
              OtherCities(currentCityName: bundle.cityName),
          ],
        );
      },
    );
  }
}
