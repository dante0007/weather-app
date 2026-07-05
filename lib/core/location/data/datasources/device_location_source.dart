import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';

abstract class DeviceLocationSource {
  Future<Either<Failure, UserLocation>> getCurrentLocation();
}

class GeolocatorDeviceLocationSource implements DeviceLocationSource {
  const GeolocatorDeviceLocationSource();

  static const _gpsTimeout = Duration(seconds: 8);
  static const _geocodeTimeout = Duration(seconds: 3);

  @override
  Future<Either<Failure, UserLocation>> getCurrentLocation() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return const Left(Failure.locationPermissionDenied());
      }

      if (!await Geolocator.isLocationServiceEnabled()) {
        return const Left(Failure.locationUnavailable());
      }

      final position = await _resolvePosition();
      if (position == null) {
        return const Left(Failure.locationUnavailable());
      }

      return Right(await _userLocationFrom(position));
    } catch (_) {
      return const Left(Failure.locationUnavailable());
    }
  }

  Future<Position?> _resolvePosition() async {
    final lastKnown = await Geolocator.getLastKnownPosition();

    try {
      final current = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: _gpsTimeout,
        ),
      );
      return current;
    } catch (_) {
      return lastKnown;
    }
  }

  Future<UserLocation> _userLocationFrom(Position position) async {
    final base = UserLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      cityName: 'Current location',
      countryCode: '',
      countryName: '',
    );

    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).timeout(_geocodeTimeout);

      if (placemarks.isEmpty) {
        return base;
      }

      final placemark = placemarks.first;
      return UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        cityName: _resolveCityName(placemark),
        countryCode: placemark.isoCountryCode ?? '',
        countryName: placemark.country ?? '',
      );
    } catch (_) {
      return base;
    }
  }

  String _resolveCityName(Placemark placemark) {
    return placemark.locality?.trim().nullIfEmpty ??
        placemark.subAdministrativeArea?.trim().nullIfEmpty ??
        placemark.administrativeArea?.trim().nullIfEmpty ??
        placemark.subLocality?.trim().nullIfEmpty ??
        'Current location';
  }
}

extension on String {
  String? get nullIfEmpty => isEmpty ? null : this;
}
