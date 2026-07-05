import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/features/weather/data/models/air_quality_response_dto.dart';
import 'package:weather_app/features/weather/data/models/forecast_response_dto.dart';
import 'package:weather_app/features/weather/data/models/geocoding_response_dto.dart';

part 'weather_remote_source.g.dart';

@RestApi(baseUrl: AppConstants.openMeteoForecastBase)
abstract class ForecastApiClient {
  factory ForecastApiClient(Dio dio, {String? baseUrl}) = _ForecastApiClient;

  @GET('/forecast')
  Future<ForecastResponseDto> getForecast({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('current')
    String current =
        'temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,weather_code,wind_speed_10m,wind_direction_10m,uv_index',
    @Query('hourly')
    String hourly =
        'temperature_2m,weather_code,precipitation_probability',
    @Query('daily')
    String daily = 'weather_code,temperature_2m_max,temperature_2m_min',
    @Query('timezone') String timezone = 'auto',
    @Query('forecast_days') int forecastDays = 7,
  });
}

@RestApi(baseUrl: AppConstants.openMeteoAirQualityBase)
abstract class AirQualityApiClient {
  factory AirQualityApiClient(Dio dio, {String? baseUrl}) = _AirQualityApiClient;

  @GET('/air-quality')
  Future<AirQualityResponseDto> getAirQuality({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('current') String current = 'us_aqi,pm2_5,pm10,ozone',
    @Query('timezone') String timezone = 'auto',
  });
}

@RestApi(baseUrl: AppConstants.openMeteoGeocodingBase)
abstract class GeocodingApiClient {
  factory GeocodingApiClient(Dio dio, {String? baseUrl}) = _GeocodingApiClient;

  @GET('/search')
  Future<GeocodingResponseDto> search({
    @Query('name') required String name,
    @Query('count') int count = 5,
    @Query('language') String language = 'en',
    @Query('format') String format = 'json',
  });
}

Dio createWeatherDio({bool enableLogging = kDebugMode}) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: const {'Accept': 'application/json'},
    ),
  );

  if (enableLogging) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
        responseBody: false,
      ),
    );
  }

  return dio;
}
