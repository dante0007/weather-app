import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';
import 'package:weather_app/core/location/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  const GetCurrentLocation(this._repository);

  final LocationRepository _repository;

  Future<Either<Failure, UserLocation>> call() {
    return _repository.getCurrentLocation();
  }
}
