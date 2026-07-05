import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_header.dart';
import 'package:weather_app/design/components/shimmer_box.dart';
import 'package:weather_app/design/components/stat_pill.dart';
import 'package:weather_app/design/static_feature_gate.dart';
import 'package:weather_app/static/static_mock_data.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Design 15 — header populated, skeletons only for gated-on cards.
class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({
    required this.scenario,
    super.key,
  });

  final StaticScenario scenario;

  static const _cardSkeletonKeys = [
    'uv_index_card',
    'air_quality_card',
    'wind_speed_card',
    'hourly_forecast',
  ];

  @override
  Widget build(BuildContext context) {
    final data = StaticScenarioHolder.resolve(scenario);
    final bundle = StaticMockData.newYorkBundle;
    final current = bundle.current;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.padding),
            children: [
              DashboardHeader(bundle: bundle),
              const SizedBox(height: AppSpacing.gapLg),
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
              for (final flagKey in _cardSkeletonKeys)
                StaticFeatureGate(
                  evaluations: data.evaluations,
                  flagKey: flagKey,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.gap),
                    child: ShimmerBox(height: 104),
                  ),
                ),
              const SizedBox(height: AppSpacing.gapLg),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.accentAmber,
                    ),
                  ),
                  SizedBox(width: AppSpacing.gapSm),
                  Text('Loading weather data…', style: AppTypography.subtitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
