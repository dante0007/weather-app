import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

part 'daily_forecast.freezed.dart';

@freezed
sealed class DaySlot with _$DaySlot {
  const factory DaySlot({
    required DateTime date,
    required WeatherCondition condition,
    required double tempMax,
    required double tempMin,
  }) = _DaySlot;
}

@freezed
sealed class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required List<DaySlot> days,
  }) = _DailyForecast;
}
