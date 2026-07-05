import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class SearchCityParams {
  const SearchCityParams({required this.query});

  final String query;
}

class SearchCity implements UseCase<List<GeoCity>, SearchCityParams> {
  SearchCity(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, List<GeoCity>>> call(SearchCityParams params) =>
      _repository.searchCity(params.query);
}
