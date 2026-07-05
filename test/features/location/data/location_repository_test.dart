import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/location/data/datasources/device_location_source.dart';
import 'package:weather_app/core/location/data/repositories/location_repository_impl.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';

class MockDeviceLocationSource extends Mock implements DeviceLocationSource {}

void main() {
  group('LocationRepositoryImpl', () {
    late MockDeviceLocationSource mockSource;
    late LocationRepositoryImpl repository;

    const location = UserLocation(
      latitude: 19.076,
      longitude: 72.8777,
      cityName: 'Mumbai',
      countryCode: 'IN',
      countryName: 'India',
    );

    setUp(() {
      mockSource = MockDeviceLocationSource();
      repository = LocationRepositoryImpl(mockSource);
    });

    test('returns Right when source resolves a location', () async {
      when(() => mockSource.getCurrentLocation())
          .thenAnswer((_) async => const Right(location));

      final result = await repository.getCurrentLocation();

      expect(result, const Right(location));
      verify(() => mockSource.getCurrentLocation()).called(1);
    });

    test('returns Left when source reports permission denied', () async {
      when(() => mockSource.getCurrentLocation()).thenAnswer(
        (_) async => const Left(Failure.locationPermissionDenied()),
      );

      final result = await repository.getCurrentLocation();

      expect(result, const Left(Failure.locationPermissionDenied()));
    });

    test('returns Left when source reports location unavailable', () async {
      when(() => mockSource.getCurrentLocation()).thenAnswer(
        (_) async => const Left(Failure.locationUnavailable()),
      );

      final result = await repository.getCurrentLocation();

      expect(result, const Left(Failure.locationUnavailable()));
    });
  });
}
