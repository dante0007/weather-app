import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/location/data/datasources/device_location_source.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';
import 'package:weather_app/core/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl(this._source);

  final DeviceLocationSource _source;

  @override
  Future<Either<Failure, UserLocation>> getCurrentLocation() {
    return _source.getCurrentLocation();
  }
}
