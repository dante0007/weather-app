import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/data/datasources/top_cities_catalog.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_source.dart';
import 'package:weather_app/features/weather/data/mappers/weather_mapper.dart';
import 'package:weather_app/features/weather/data/models/air_quality_response_dto.dart';
import 'package:weather_app/features/weather/data/models/forecast_response_dto.dart';
import 'package:weather_app/features/weather/data/models/geocoding_response_dto.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required ForecastApiClient forecastClient,
    required AirQualityApiClient airQualityClient,
    required GeocodingApiClient geocodingClient,
  })  : _forecastClient = forecastClient,
        _airQualityClient = airQualityClient,
        _geocodingClient = geocodingClient;

  final ForecastApiClient _forecastClient;
  final AirQualityApiClient _airQualityClient;
  final GeocodingApiClient _geocodingClient;

  @override
  Future<Either<Failure, WeatherBundle>> getWeather({
    required double lat,
    required double lon,
    required String cityName,
  }) async {
    try {
      final (ForecastResponseDto forecast, AirQualityResponseDto airQuality) =
          await (
        _forecastClient.getForecast(latitude: lat, longitude: lon),
        _airQualityClient.getAirQuality(latitude: lat, longitude: lon),
      ).wait;

      return Right(
        mapWeatherBundle(
          forecast: forecast,
          airQuality: airQuality,
          cityName: cityName,
        ),
      );
    } on DioException catch (error) {
      return Left(_mapDioException(error));
    } catch (error) {
      return Left(Failure.unknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GeoCity>>> searchCity(String query) async {
    try {
      final response = await _geocodingClient.search(name: query);
      return Right(mapGeoCities(response));
    } on DioException catch (error) {
      return Left(_mapDioException(error));
    } catch (error) {
      return Left(Failure.unknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GeoCity>>> topCitiesForCountry(
    String countryCode,
  ) async {
    try {
      final normalized = countryCode.toUpperCase();
      final cityNames = TopCitiesCatalog.cityNamesFor(normalized);
      final filterByCountry = TopCitiesCatalog.isCuratedCountry(normalized);

      final geocoded = await Future.wait(
        cityNames.map(
          (name) => _geocodeCity(
            name,
            filterByCountry ? normalized : null,
          ),
        ),
      );

      final cities = geocoded.whereType<GeoCity>().toList();
      if (cities.isEmpty) {
        return const Right([]);
      }

      return Right(cities);
    } on DioException catch (error) {
      return Left(_mapDioException(error));
    } catch (error) {
      return Left(Failure.unknownFailure(error.toString()));
    }
  }

  Future<GeoCity?> _geocodeCity(String name, String? countryCode) async {
    final response = await _geocodingClient.search(name: name, count: 5);
    final results = response.results;
    if (results == null || results.isEmpty) {
      return null;
    }

    if (countryCode == null) {
      final match = results.first;
      return GeoCity(
        name: match.name,
        country: match.country,
        lat: match.latitude,
        lon: match.longitude,
      );
    }

    GeocodingResultDto? match;
    for (final result in results) {
      if (result.countryCode?.toUpperCase() == countryCode) {
        match = result;
        break;
      }
    }
    match ??= results.first;

    if (match.countryCode != null &&
        match.countryCode!.toUpperCase() != countryCode) {
      return null;
    }

    return GeoCity(
      name: match.name,
      country: match.country,
      lat: match.latitude,
      lon: match.longitude,
    );
  }

  Failure _mapDioException(DioException error) {
    if (_isNetworkError(error)) {
      return const Failure.networkFailure();
    }

    final statusCode = error.response?.statusCode;
    if (statusCode != null && statusCode >= 500) {
      return Failure.serverFailure(
        'Open-Meteo server error ($statusCode)',
      );
    }

    if (statusCode != null && statusCode >= 400) {
      return Failure.serverFailure(
        error.message ?? 'Open-Meteo request failed ($statusCode)',
      );
    }

    return Failure.serverFailure(error.message ?? 'Weather request failed');
  }

  bool _isNetworkError(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
  }
}
