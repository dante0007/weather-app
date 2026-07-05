import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_condition.freezed.dart';

enum WeatherConditionType {
  clear,
  partlyCloudy,
  cloudy,
  fog,
  drizzle,
  rain,
  freezingRain,
  snow,
  rainShowers,
  snowShowers,
  thunderstorm,
  unknown,
}

@freezed
sealed class WeatherCondition with _$WeatherCondition {
  const factory WeatherCondition({
    required WeatherConditionType type,
    required String label,
    required String iconKey,
  }) = _WeatherCondition;

  factory WeatherCondition.fromWmoCode(int code) {
    final mapped = _mapWmoCode(code);
    return WeatherCondition(
      type: mapped.$1,
      label: mapped.$2,
      iconKey: mapped.$3,
    );
  }
}

(WeatherConditionType, String, String) _mapWmoCode(int code) {
  return switch (code) {
    0 => (
        WeatherConditionType.clear,
        'Clear',
        'clear',
      ),
    1 => (
        WeatherConditionType.partlyCloudy,
        'Mainly clear',
        'partly_cloudy',
      ),
    2 => (
        WeatherConditionType.partlyCloudy,
        'Partly cloudy',
        'partly_cloudy',
      ),
    3 => (
        WeatherConditionType.cloudy,
        'Overcast',
        'cloudy',
      ),
    45 || 48 => (
        WeatherConditionType.fog,
        'Fog',
        'fog',
      ),
    51 || 53 || 55 => (
        WeatherConditionType.drizzle,
        'Drizzle',
        'drizzle',
      ),
    56 || 57 => (
        WeatherConditionType.freezingRain,
        'Freezing drizzle',
        'freezing_rain',
      ),
    61 || 63 || 65 => (
        WeatherConditionType.rain,
        'Rain',
        'rain',
      ),
    66 || 67 => (
        WeatherConditionType.freezingRain,
        'Freezing rain',
        'freezing_rain',
      ),
    71 || 73 || 75 || 77 => (
        WeatherConditionType.snow,
        'Snow',
        'snow',
      ),
    80 || 81 || 82 => (
        WeatherConditionType.rainShowers,
        'Rain showers',
        'rain_showers',
      ),
    85 || 86 => (
        WeatherConditionType.snowShowers,
        'Snow showers',
        'snow_showers',
      ),
    95 => (
        WeatherConditionType.thunderstorm,
        'Thunderstorm',
        'thunderstorm',
      ),
    96 || 99 => (
        WeatherConditionType.thunderstorm,
        'Thunderstorm with hail',
        'thunderstorm_hail',
      ),
    _ => (
        WeatherConditionType.unknown,
        'Unknown',
        'unknown',
      ),
  };
}
