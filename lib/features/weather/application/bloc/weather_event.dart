import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/weather/domain/entities/geo_city.dart';

part 'weather_event.freezed.dart';

@freezed
sealed class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.loadRequested({
    required double lat,
    required double lon,
    required String cityName,
  }) = WeatherLoadRequested;

  const factory WeatherEvent.cityChanged(GeoCity city) = WeatherCityChanged;

  const factory WeatherEvent.refreshRequested() = WeatherRefreshRequested;
}
