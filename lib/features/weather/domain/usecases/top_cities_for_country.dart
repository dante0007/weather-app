import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/city_weather.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class TopCitiesForCountryParams {
  const TopCitiesForCountryParams({
    required this.countryCode,
    this.excludeCityName,
  });

  final String countryCode;
  final String? excludeCityName;
}

class TopCitiesForCountry {
  const TopCitiesForCountry(this._repository);

  final WeatherRepository _repository;

  Future<Either<Failure, List<CityWeather>>> call(
    TopCitiesForCountryParams params,
  ) async {
    final citiesResult = await _repository.topCitiesForCountry(
      params.countryCode,
    );

    return citiesResult.fold(Left.new, (cities) async {
      final visible = cities
          .where((city) => city.name != params.excludeCityName)
          .take(5)
          .toList();

      final snapshots = await Future.wait(
        visible.map(_fetchCityWeather),
      );

      return Right(snapshots.whereType<CityWeather>().toList());
    });
  }

  Future<CityWeather?> _fetchCityWeather(GeoCity city) async {
    final result = await _repository.getWeather(
      lat: city.lat,
      lon: city.lon,
      cityName: city.name,
    );

    return result.fold(
      (_) => null,
      (bundle) => CityWeather(
        city: city,
        condition: bundle.current.condition,
        temperature: bundle.current.temperature,
      ),
    );
  }
}
