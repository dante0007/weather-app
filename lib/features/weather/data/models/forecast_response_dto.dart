import 'package:json_annotation/json_annotation.dart';

part 'forecast_response_dto.g.dart';

@JsonSerializable()
class ForecastResponseDto {
  const ForecastResponseDto({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory ForecastResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseDtoFromJson(json);

  final ForecastCurrentDto current;
  final ForecastHourlyDto hourly;
  final ForecastDailyDto daily;

  Map<String, dynamic> toJson() => _$ForecastResponseDtoToJson(this);
}

@JsonSerializable()
class ForecastCurrentDto {
  const ForecastCurrentDto({
    @JsonKey(name: 'temperature_2m') required this.temperature2m,
    @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m,
    @JsonKey(name: 'apparent_temperature') required this.apparentTemperature,
    @JsonKey(name: 'is_day') required this.isDay,
    required this.precipitation,
    @JsonKey(name: 'weather_code') required this.weatherCode,
    @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m,
    @JsonKey(name: 'wind_direction_10m') required this.windDirection10m,
    @JsonKey(name: 'uv_index') required this.uvIndex,
  });

  factory ForecastCurrentDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastCurrentDtoFromJson(json);

  final double temperature2m;
  final int relativeHumidity2m;
  final double apparentTemperature;
  final int isDay;
  final double precipitation;
  final int weatherCode;
  final double windSpeed10m;
  final int windDirection10m;
  final double uvIndex;

  Map<String, dynamic> toJson() => _$ForecastCurrentDtoToJson(this);
}

@JsonSerializable()
class ForecastHourlyDto {
  const ForecastHourlyDto({
    required this.time,
    @JsonKey(name: 'temperature_2m') required this.temperature2m,
    @JsonKey(name: 'weather_code') required this.weatherCode,
    @JsonKey(name: 'precipitation_probability')
    required this.precipitationProbability,
  });

  factory ForecastHourlyDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyDtoFromJson(json);

  final List<String> time;
  final List<double> temperature2m;
  final List<int> weatherCode;
  final List<double> precipitationProbability;

  Map<String, dynamic> toJson() => _$ForecastHourlyDtoToJson(this);
}

@JsonSerializable()
class ForecastDailyDto {
  const ForecastDailyDto({
    required this.time,
    @JsonKey(name: 'weather_code') required this.weatherCode,
    @JsonKey(name: 'temperature_2m_max') required this.temperature2mMax,
    @JsonKey(name: 'temperature_2m_min') required this.temperature2mMin,
  });

  factory ForecastDailyDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDailyDtoFromJson(json);

  final List<String> time;
  final List<int> weatherCode;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;

  Map<String, dynamic> toJson() => _$ForecastDailyDtoToJson(this);
}
