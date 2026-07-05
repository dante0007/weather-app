import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Design 14 — graceful degradation when config fetch fails.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.scenario,
    super.key,
  });

  final StaticScenario scenario;

  @override
  Widget build(BuildContext context) {
    final data = StaticScenarioHolder.resolve(scenario);
    final configId = data.config?.configId ?? 'config_a';

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.padding),
            child: GlassCard(
              borderRadius: AppRadii.cardLg,
              elevated: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.accentAlert,
                    size: 40,
                  ),
                  const SizedBox(height: AppSpacing.gap),
                  const Text(
                    'Failed to load configuration',
                    textAlign: TextAlign.center,
                    style: AppTypography.title,
                  ),
                  const SizedBox(height: AppSpacing.gapSm),
                  const Text(
                    'Network unavailable. Showing the last cached '
                    'configuration to keep things running.',
                    textAlign: TextAlign.center,
                    style: AppTypography.subtitle,
                  ),
                  const SizedBox(height: AppSpacing.gap),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.glassSurface,
                      borderRadius: AppRadii.pill,
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Using cached config ($configId)',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.gapLg),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.accentAmber,
                        foregroundColor: AppColors.backgroundTop,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadii.cardLg,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
