import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherParams {
  const GetWeatherParams({
    required this.lat,
    required this.lon,
    required this.cityName,
  });

  final double lat;
  final double lon;
  final String cityName;
}

class GetWeather implements UseCase<WeatherBundle, GetWeatherParams> {
  GetWeather(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, WeatherBundle>> call(GetWeatherParams params) =>
      _repository.getWeather(
        lat: params.lat,
        lon: params.lon,
        cityName: params.cityName,
      );
}
