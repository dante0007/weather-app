// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponseDto _$ForecastResponseDtoFromJson(
  Map<String, dynamic> json,
) => ForecastResponseDto(
  current: ForecastCurrentDto.fromJson(json['current'] as Map<String, dynamic>),
  hourly: ForecastHourlyDto.fromJson(json['hourly'] as Map<String, dynamic>),
  daily: ForecastDailyDto.fromJson(json['daily'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForecastResponseDtoToJson(
  ForecastResponseDto instance,
) => <String, dynamic>{
  'current': instance.current,
  'hourly': instance.hourly,
  'daily': instance.daily,
};

ForecastCurrentDto _$ForecastCurrentDtoFromJson(Map<String, dynamic> json) =>
    ForecastCurrentDto(
      temperature2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      apparentTemperature: (json['apparent_temperature'] as num).toDouble(),
      isDay: (json['is_day'] as num).toInt(),
      precipitation: (json['precipitation'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toInt(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      windDirection10m: (json['wind_direction_10m'] as num).toInt(),
      uvIndex: (json['uv_index'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastCurrentDtoToJson(ForecastCurrentDto instance) =>
    <String, dynamic>{
      'temperature_2m': instance.temperature2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'apparent_temperature': instance.apparentTemperature,
      'is_day': instance.isDay,
      'precipitation': instance.precipitation,
      'weather_code': instance.weatherCode,
      'wind_speed_10m': instance.windSpeed10m,
      'wind_direction_10m': instance.windDirection10m,
      'uv_index': instance.uvIndex,
    };

ForecastHourlyDto _$ForecastHourlyDtoFromJson(Map<String, dynamic> json) =>
    ForecastHourlyDto(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      precipitationProbability:
          (json['precipitation_probability'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
    );

Map<String, dynamic> _$ForecastHourlyDtoToJson(ForecastHourlyDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'weather_code': instance.weatherCode,
      'precipitation_probability': instance.precipitationProbability,
    };

ForecastDailyDto _$ForecastDailyDtoFromJson(Map<String, dynamic> json) =>
    ForecastDailyDto(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      temperature2mMax: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ForecastDailyDtoToJson(ForecastDailyDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weather_code': instance.weatherCode,
      'temperature_2m_max': instance.temperature2mMax,
      'temperature_2m_min': instance.temperature2mMin,
    };
