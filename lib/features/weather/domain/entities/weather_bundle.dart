import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';

part 'weather_bundle.freezed.dart';

@freezed
sealed class WeatherBundle with _$WeatherBundle {
  const factory WeatherBundle({
    required CurrentWeather current,
    required HourlyForecast hourly,
    required DailyForecast daily,
    required AirQuality airQuality,
    required String cityName,
  }) = _WeatherBundle;
}
