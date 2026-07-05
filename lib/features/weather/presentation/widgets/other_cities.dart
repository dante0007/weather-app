import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/glass_card.dart';
import 'package:weather_app/core/widgets/weather_icon.dart';
import 'package:weather_app/features/weather/application/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/domain/entities/city_weather.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';

class OtherCities extends StatelessWidget {
  const OtherCities({
    required this.cities,
    this.currentCityName,
    this.onCitySelected,
    super.key,
  });

  final List<CityWeather> cities;
  final String? currentCityName;
  final void Function(GeoCity city)? onCitySelected;

  @override
  Widget build(BuildContext context) {
    final visible = cities
        .where((entry) => entry.city.name != currentCityName)
        .toList();

    if (visible.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Other Cities', style: AppTypography.title),
            const Spacer(),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.glassSurface,
                borderRadius: AppRadii.pill,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.gap),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: visible.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSpacing.gap),
            itemBuilder: (context, index) {
              final entry = visible[index];
              return _CityCard(
                entry: entry,
                onTap: () => _handleTap(context, entry.city),
              );
            },
          ),
        ),
      ],
    );
  }

  void _handleTap(BuildContext context, GeoCity city) {
    if (onCitySelected != null) {
      onCitySelected!(city);
      return;
    }

    context.read<WeatherBloc>().add(WeatherEvent.cityChanged(city));
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({
    required this.entry,
    required this.onTap,
  });

  final CityWeather entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final city = entry.city;

    return SizedBox(
      width: 108,
      child: GlassCard(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadii.card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                city.name,
                style: AppTypography.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                entry.condition.label,
                style: AppTypography.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.gapSm),
              Row(
                children: [
                  WeatherIcon(condition: entry.condition, size: 24),
                  const Spacer(),
                  Text(
                    '${entry.temperature.round()}°',
                    style: AppTypography.subtitle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
