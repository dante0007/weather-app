import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';

class SevereWeatherAlertBanner extends StatelessWidget {
  const SevereWeatherAlertBanner({
    super.key,
    this.onDismiss,
  });

  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.padding),
      decoration: BoxDecoration(
        gradient: AppColors.alertGradient,
        borderRadius: AppRadii.cardLg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.textPrimary),
          const SizedBox(width: AppSpacing.gap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Severe Thunderstorm Warning',
                  style: AppTypography.title.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Active until 8:00 PM · Seek shelter indoors',
                  style: AppTypography.subtitle.copyWith(
                    color: AppColors.textPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDismiss,
            icon: const Icon(Icons.close, color: AppColors.textPrimary, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
