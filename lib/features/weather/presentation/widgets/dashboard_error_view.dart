import 'package:flutter/material.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/glass_card.dart';

/// Error state for the live dashboard (design 14, weather fetch).
class DashboardErrorView extends StatelessWidget {
  const DashboardErrorView({
    required this.failure,
    required this.onRetry,
    super.key,
  });

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
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
                  'Failed to load weather',
                  textAlign: TextAlign.center,
                  style: AppTypography.title,
                ),
                const SizedBox(height: AppSpacing.gapSm),
                Text(
                  _messageFor(failure),
                  textAlign: TextAlign.center,
                  style: AppTypography.subtitle,
                ),
                const SizedBox(height: AppSpacing.gapLg),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onRetry,
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
    );
  }

  String _messageFor(Failure failure) {
    return failure.when(
      serverFailure: (message) => message,
      networkFailure: () =>
          'Network unavailable. Check your connection and try again.',
      cacheFailure: () => 'Could not read cached weather data.',
      configParseFailure: (message) => message,
      unknownFailure: (message) => message,
      locationPermissionDenied: () =>
          'Location permission denied. Enable location access in settings.',
      locationUnavailable: () =>
          'Could not determine your location. Showing default city.',
    );
  }
}
