import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

part 'hourly_forecast.freezed.dart';

@freezed
sealed class HourSlot with _$HourSlot {
  const factory HourSlot({
    required DateTime time,
    required double temperature,
    required WeatherCondition condition,
    required double precipitationProbability,
  }) = _HourSlot;
}

@freezed
sealed class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required List<HourSlot> slots,
  }) = _HourlyForecast;
}
