import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';

const _runLiveNetworkTests = bool.fromEnvironment('RUN_LIVE_NETWORK_TESTS');

void main() {
  if (!_runLiveNetworkTests) {
    test(
      'Open-Meteo live smoke (skipped by default)',
      () {},
      skip: 'Set --dart-define=RUN_LIVE_NETWORK_TESTS=true to run',
    );
    return;
  }

  late WeatherRepositoryImpl repository;

  setUp(() {
    final dio = createWeatherDio(enableLogging: false);
    repository = WeatherRepositoryImpl(
      forecastClient: ForecastApiClient(dio),
      airQualityClient: AirQualityApiClient(dio),
      geocodingClient: GeocodingApiClient(dio),
    );
  });

  test('fetches a populated WeatherBundle for New York', () async {
    final result = await repository.getWeather(
      lat: 40.71,
      lon: -74.01,
      cityName: 'New York',
    );

    await result.fold(
      (failure) => fail('expected Right but got $failure'),
      (bundle) async {
        expect(bundle.cityName, 'New York');
        expect(bundle.current.temperature, isA<double>());
        expect(bundle.hourly.slots, isNotEmpty);
        expect(bundle.daily.days.length, 7);
        expect(bundle.airQuality.aqi, greaterThanOrEqualTo(0));
      },
    );
  });
}
