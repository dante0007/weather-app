import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/shimmer_box.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/feature_gate.dart';

/// Loading skeleton for the live dashboard (design 15).
class DashboardShimmerView extends StatelessWidget {
  const DashboardShimmerView({super.key});

  static const _cardSkeletonKeys = [
    'uv_index_card',
    'air_quality_card',
    'wind_speed_card',
    'hourly_forecast',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.padding),
        children: [
          Text('Your location', style: AppTypography.title.copyWith(fontSize: 22)),
          const SizedBox(height: 4),
          const ShimmerBox(height: 18, width: 120),
          const SizedBox(height: AppSpacing.gap),
          const Center(child: ShimmerBox(height: 88, width: 88)),
          const SizedBox(height: AppSpacing.gap),
          const Center(child: ShimmerBox(height: 56, width: 96)),
          const SizedBox(height: AppSpacing.gapLg),
          Row(
            children: [
              const Expanded(child: ShimmerBox(height: 56)),
              const SizedBox(width: AppSpacing.gap),
              const Expanded(child: ShimmerBox(height: 56)),
              const SizedBox(width: AppSpacing.gap),
              const Expanded(child: ShimmerBox(height: 56)),
            ],
          ),
          const SizedBox(height: AppSpacing.gap),
          for (final flagKey in _cardSkeletonKeys)
            FeatureGate(
              flagKey: flagKey,
              builder: (_) => const Padding(
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
    );
  }
}
