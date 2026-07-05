import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/glass_card.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/feature_gate.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class SevenDayForecastLink extends StatelessWidget {
  const SevenDayForecastLink({
    required this.bundle,
    super.key,
  });

  final WeatherBundle bundle;

  @override
  Widget build(BuildContext context) {
    return FeatureGate(
      flagKey: 'seven_day_forecast',
      builder: (_) => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.gap),
        child: GlassCard(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.padding,
            vertical: AppSpacing.gap,
          ),
          child: InkWell(
            onTap: () => context.pushNamed(
              AppRouteNames.forecast,
              extra: bundle,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.accentAmber,
                ),
                const SizedBox(width: AppSpacing.gap),
                Expanded(
                  child: Text(
                    '7-Day Forecasts',
                    style: AppTypography.title.copyWith(fontSize: 16),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
