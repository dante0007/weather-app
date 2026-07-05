import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';
import 'package:weather_app/core/location/domain/usecases/get_current_location.dart';
import 'package:weather_app/features/weather/application/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/application/bloc/weather_state.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/city_weather.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/top_cities_for_country.dart';

class MockGetWeather extends Mock implements GetWeather {}

class MockGetCurrentLocation extends Mock implements GetCurrentLocation {}

class MockTopCitiesForCountry extends Mock implements TopCitiesForCountry {}

void main() {
  late MockGetWeather mockGetWeather;
  late MockGetCurrentLocation mockGetCurrentLocation;
  late MockTopCitiesForCountry mockTopCitiesForCountry;

  final bundle = WeatherBundle(
    cityName: 'New York',
    current: CurrentWeather(
      temperature: 72,
      feelsLike: 70,
      condition: WeatherCondition.fromWmoCode(0),
      humidity: 55,
      precipitationProbability: 10,
      windSpeed: 8,
      windDirection: 180,
      uvIndex: 4,
      isDay: true,
    ),
    hourly: const HourlyForecast(slots: []),
    daily: const DailyForecast(days: []),
    airQuality: const AirQuality(
      aqi: 42,
      category: AirQualityCategory.good,
      dominantPollutant: 'pm2_5',
    ),
  );

  const deviceLocation = UserLocation(
    latitude: 40.71,
    longitude: -74.01,
    cityName: 'New York',
    countryCode: 'US',
    countryName: 'United States',
  );

  final otherCities = [
    CityWeather(
      city: const GeoCity(
        name: 'Los Angeles',
        country: 'United States',
        lat: 34.05,
        lon: -118.24,
      ),
      condition: WeatherCondition.fromWmoCode(0),
      temperature: 80,
    ),
  ];

  setUpAll(() {
    registerFallbackValue(
      const GetWeatherParams(lat: 0, lon: 0, cityName: 'fallback'),
    );
    registerFallbackValue(
      const TopCitiesForCountryParams(countryCode: 'US'),
    );
  });

  setUp(() {
    mockGetWeather = MockGetWeather();
    mockGetCurrentLocation = MockGetCurrentLocation();
    mockTopCitiesForCountry = MockTopCitiesForCountry();
  });

  WeatherBloc buildBloc() => WeatherBloc(
        mockGetWeather,
        mockGetCurrentLocation,
        mockTopCitiesForCountry,
      );

  group('WeatherBloc', () {
    blocTest<WeatherBloc, WeatherState>(
      'deviceLocationRequested emits loading then loaded with top cities',
      build: () {
        when(() => mockGetCurrentLocation()).thenAnswer(
          (_) async => const Right(deviceLocation),
        );
        when(() => mockGetWeather(any())).thenAnswer((_) async => Right(bundle));
        when(() => mockTopCitiesForCountry(any())).thenAnswer(
          (_) async => Right(otherCities),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(const WeatherEvent.deviceLocationRequested()),
      expect: () => [
        const WeatherState.loading(),
        isA<WeatherLoaded>()
            .having((s) => s.bundle.cityName, 'cityName', 'New York')
            .having((s) => s.otherCities, 'otherCities', isEmpty),
        isA<WeatherLoaded>()
            .having((s) => s.otherCities.length, 'otherCities', 1),
      ],
      verify: (_) {
        verify(() => mockGetCurrentLocation()).called(1);
        verify(() => mockGetWeather(any())).called(1);
        verify(() => mockTopCitiesForCountry(any())).called(1);
      },
    );

    blocTest<WeatherBloc, WeatherState>(
      'loadRequested emits loading then loaded',
      build: () {
        when(() => mockGetWeather(any())).thenAnswer((_) async => Right(bundle));
        when(() => mockTopCitiesForCountry(any())).thenAnswer(
          (_) async => const Right([]),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(
        const WeatherEvent.loadRequested(
          lat: 40.71,
          lon: -74.01,
          cityName: 'New York',
        ),
      ),
      expect: () => [
        const WeatherState.loading(),
        isA<WeatherLoaded>(),
      ],
      verify: (_) {
        verify(() => mockGetWeather(any())).called(1);
      },
    );
  });
}
