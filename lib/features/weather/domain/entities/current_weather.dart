import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

part 'current_weather.freezed.dart';

@freezed
sealed class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    required double temperature,
    required double feelsLike,
    required WeatherCondition condition,
    required int humidity,
    required double precipitationProbability,
    required double windSpeed,
    required int windDirection,
    required double uvIndex,
    required bool isDay,
  }) = _CurrentWeather;
}
