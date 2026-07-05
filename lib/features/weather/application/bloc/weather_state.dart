import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/city_weather.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

part 'weather_state.freezed.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;

  const factory WeatherState.loading() = WeatherLoading;

  const factory WeatherState.loaded(
    WeatherBundle bundle, {
    @Default([]) List<CityWeather> otherCities,
    Failure? locationNotice,
  }) = WeatherLoaded;

  const factory WeatherState.error(Failure failure) = WeatherError;
}
