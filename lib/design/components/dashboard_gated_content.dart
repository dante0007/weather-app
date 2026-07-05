import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/features/weather/presentation/widgets/air_quality_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_forecast_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/other_cities.dart';
import 'package:weather_app/features/weather/presentation/widgets/uv_index_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/wind_speed_card.dart';
import 'package:weather_app/design/components/stat_pill.dart';
import 'package:weather_app/design/static_feature_gate.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/static/static_scenario.dart';

class DashboardGatedContent extends StatelessWidget {
  const DashboardGatedContent({
    required this.data,
    required this.bundle,
    super.key,
    this.showOtherCities = true,
  });

  final StaticScenarioData data;
  final WeatherBundle bundle;
  final bool showOtherCities;

  bool get _isDetailed =>
      data.evaluations['layout_variant']?.variant == 'detailed';

  @override
  Widget build(BuildContext context) {
    final current = bundle.current;

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
        StaticFeatureGate(
          evaluations: data.evaluations,
          flagKey: 'uv_index_card',
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.gap),
            child: UvIndexCard(bundle: bundle, detailed: _isDetailed),
          ),
        ),
        StaticFeatureGate(
          evaluations: data.evaluations,
          flagKey: 'air_quality_card',
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.gap),
            child: AirQualityCard(bundle: bundle, detailed: _isDetailed),
          ),
        ),
        StaticFeatureGate(
          evaluations: data.evaluations,
          flagKey: 'wind_speed_card',
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.gap),
            child: WindSpeedCard(bundle: bundle, detailed: _isDetailed),
          ),
        ),
        StaticFeatureGate(
          evaluations: data.evaluations,
          flagKey: 'hourly_forecast',
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.gap),
            child: HourlyForecastCard(bundle: bundle, detailed: _isDetailed),
          ),
        ),
        if (showOtherCities) const OtherCities(),
      ],
    );
  }
}
