import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

/// Dev/test weather repository returning a canned bundle without network calls.
///
/// Register in GetIt instead of [WeatherRepositoryImpl] to run the UI before
/// Open-Meteo is wired. Tests import fixtures from `test/fixtures/`.
class FakeWeatherRepository implements WeatherRepository {
  FakeWeatherRepository({
    required WeatherBundle bundle,
    List<GeoCity> topCities = const [],
  })  : _bundle = bundle,
        _topCities = topCities;

  final WeatherBundle _bundle;
  final List<GeoCity> _topCities;

  @override
  Future<Either<Failure, WeatherBundle>> getWeather({
    required double lat,
    required double lon,
    required String cityName,
  }) async {
    return Right(_bundle.copyWith(cityName: cityName));
  }

  @override
  Future<Either<Failure, List<GeoCity>>> searchCity(String query) async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<GeoCity>>> topCitiesForCountry(
    String countryCode,
  ) async {
    return Right(_topCities);
  }
}
