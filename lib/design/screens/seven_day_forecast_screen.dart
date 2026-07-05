import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/design/components/weather_icon.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/static/static_mock_data.dart';

/// Seven-day daily forecast list (static phase).
class SevenDayForecastScreen extends StatelessWidget {
  const SevenDayForecastScreen({super.key});

  static const _weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    final bundle = StaticMockData.newYorkBundle;
    final days = bundle.daily.days;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text('${bundle.cityName} · 7-Day'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.padding),
          itemCount: days.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.gapSm),
          itemBuilder: (context, index) {
            return _DayRow(day: days[index], label: _dayLabel(days[index]));
          },
        ),
      ),
    );
  }

  static String _dayLabel(DaySlot day) {
    final weekday = _weekdays[day.date.weekday - 1];
    final month = day.date.month;
    final date = day.date.day;
    return '$weekday  $month/$date';
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.day,
    required this.label,
  });

  final DaySlot day;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.padding,
        vertical: AppSpacing.gap,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(label, style: AppTypography.subtitle),
          ),
          WeatherIcon(condition: day.condition, size: 36),
          const SizedBox(width: AppSpacing.gap),
          Expanded(
            child: Text(day.condition.label, style: AppTypography.subtitle),
          ),
          Text(
            'H:${day.tempMax.round()}°',
            style: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: AppSpacing.gapSm),
          Text(
            'L:${day.tempMin.round()}°',
            style: AppTypography.caption,
          ),
        ],
      ),
    );
  }
}
