import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/features/weather/application/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/presentation/constants/preset_cities.dart';

class OtherCities extends StatelessWidget {
  const OtherCities({
    this.currentCityName,
    super.key,
  });

  final String? currentCityName;

  @override
  Widget build(BuildContext context) {
    final cities = WeatherPresetCities.others
        .where((city) => city.name != currentCityName)
        .toList();

    if (cities.isEmpty) {
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
            itemCount: cities.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSpacing.gap),
            itemBuilder: (context, index) {
              return _CityCard(
                city: cities[index],
                onTap: () => context.read<WeatherBloc>().add(
                      WeatherEvent.cityChanged(cities[index]),
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({
    required this.city,
    required this.onTap,
  });

  final GeoCity city;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: GlassCard(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadii.card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city.name, style: AppTypography.subtitle),
              Text(
                city.country,
                style: AppTypography.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.location_city_outlined,
                    size: 28,
                    color: AppColors.textSecondary,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: AppColors.textMuted,
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
