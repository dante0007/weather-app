import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

part 'city_weather.freezed.dart';

@freezed
sealed class CityWeather with _$CityWeather {
  const factory CityWeather({
    required GeoCity city,
    required WeatherCondition condition,
    required double temperature,
  }) = _CityWeather;
}
