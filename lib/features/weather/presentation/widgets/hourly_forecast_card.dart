import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/glass_card.dart';
import 'package:weather_app/core/widgets/weather_icon.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    required this.bundle,
    required this.detailed,
    super.key,
  });

  final WeatherBundle bundle;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final slots = bundle.hourly.slots;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              detailed ? 'Hourly Forecast' : 'Today',
              style: AppTypography.title,
            ),
            const Spacer(),
            if (detailed)
              const Text('Next 12h', style: AppTypography.caption),
          ],
        ),
        const SizedBox(height: AppSpacing.gap),
        SizedBox(
          height: detailed ? 132 : 104,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: slots.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSpacing.gapSm),
            itemBuilder: (context, index) {
              return _HourSlotCard(
                slot: slots[index],
                timeLabel: _formatHour(slots[index].time),
                highlighted: index == 0,
                detailed: detailed,
              );
            },
          ),
        ),
      ],
    );
  }
}

String _formatHour(DateTime time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final period = time.hour >= 12 ? 'PM' : 'AM';
  return '$hour $period';
}

class _HourSlotCard extends StatelessWidget {
  const _HourSlotCard({
    required this.slot,
    required this.timeLabel,
    required this.highlighted,
    required this.detailed,
  });

  final HourSlot slot;
  final String timeLabel;
  final bool highlighted;
  final bool detailed;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(timeLabel, style: AppTypography.caption),
        const SizedBox(height: 8),
        WeatherIcon(condition: slot.condition, size: detailed ? 30 : 26),
        if (detailed) ...[
          const SizedBox(height: 4),
          Text(
            slot.condition.label,
            style: AppTypography.caption.copyWith(fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: 8),
        Text(
          '${slot.temperature.round()}°',
          style: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );

    if (highlighted) {
      return GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        borderRadius: AppRadii.cardLg,
        elevated: true,
        child: SizedBox(width: detailed ? 76 : 60, child: child),
      );
    }

    return SizedBox(
      width: detailed ? 72 : 56,
      child: child,
    );
  }
}
