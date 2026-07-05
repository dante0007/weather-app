import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/features/weather/data/datasources/weather_remote_source.dart';
import 'package:weather_app/features/weather/data/models/geocoding_response_dto.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';

class MockForecastApiClient extends Mock implements ForecastApiClient {}

class MockAirQualityApiClient extends Mock implements AirQualityApiClient {}

class MockGeocodingApiClient extends Mock implements GeocodingApiClient {}

void main() {
  late MockForecastApiClient mockForecastClient;
  late MockAirQualityApiClient mockAirQualityClient;
  late MockGeocodingApiClient mockGeocodingClient;
  late WeatherRepositoryImpl repository;

  setUp(() {
    mockForecastClient = MockForecastApiClient();
    mockAirQualityClient = MockAirQualityApiClient();
    mockGeocodingClient = MockGeocodingApiClient();
    repository = WeatherRepositoryImpl(
      forecastClient: mockForecastClient,
      airQualityClient: mockAirQualityClient,
      geocodingClient: mockGeocodingClient,
    );
  });

  group('topCitiesForCountry', () {
    test('geocodes curated US cities and filters by country code', () async {
      when(
        () => mockGeocodingClient.search(name: any(named: 'name'), count: any(named: 'count')),
      ).thenAnswer(
        (invocation) async {
          final name = invocation.namedArguments[#name] as String;
          return GeocodingResponseDto(
            results: [
              GeocodingResultDto(
                name: name,
                country: 'United States',
                countryCode: 'US',
                latitude: 40.0,
                longitude: -74.0,
              ),
            ],
          );
        },
      );

      final result = await repository.topCitiesForCountry('US');

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('expected Right'),
        (cities) {
          expect(cities, hasLength(5));
          expect(cities.first, isA<GeoCity>());
          expect(cities.first.name, isNotEmpty);
        },
      );
      verify(() => mockGeocodingClient.search(name: any(named: 'name'), count: 5))
          .called(5);
    });
  });
}
