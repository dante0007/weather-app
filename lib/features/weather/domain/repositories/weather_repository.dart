import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherBundle>> getWeather({
    required double lat,
    required double lon,
    required String cityName,
  });

  Future<Either<Failure, List<GeoCity>>> searchCity(String query);

  Future<Either<Failure, List<GeoCity>>> topCitiesForCountry(String countryCode);
}
