import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/weather_icon.dart';
import 'package:weather_app/static/static_mock_data.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Design 01 — app loading / splash while config is fetched.
class SplashScreen extends StatelessWidget {
  const SplashScreen({
    required this.scenario,
    super.key,
  });

  final StaticScenario scenario;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherIcon(
                condition: StaticMockData.newYorkBundle.current.condition,
                size: 96,
              ),
              const SizedBox(height: AppSpacing.gap),
              Text(
                'Weatherly',
                style: AppTypography.title.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 4),
              Text(
                'REMOTE CONFIG',
                style: AppTypography.caption.copyWith(letterSpacing: 1.4),
              ),
              const SizedBox(height: AppSpacing.gapLg),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.accentAmber,
                ),
              ),
              const SizedBox(height: AppSpacing.gap),
              const Text(
                'Fetching configuration…',
                style: AppTypography.subtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
