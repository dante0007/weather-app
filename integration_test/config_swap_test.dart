import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';
import 'package:weather_app/core/location/domain/usecases/get_current_location.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/top_cities_for_country.dart';

import '../test/fixtures/scenario_users.dart';

class MockGetWeather extends Mock implements GetWeather {}

class MockGetCurrentLocation extends Mock implements GetCurrentLocation {}

class MockTopCitiesForCountry extends Mock implements TopCitiesForCountry {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockGetWeather mockGetWeather;
  late MockGetCurrentLocation mockGetCurrentLocation;
  late MockTopCitiesForCountry mockTopCitiesForCountry;

  const deviceLocation = UserLocation(
    latitude: 40.71,
    longitude: -74.01,
    cityName: 'New York',
    countryCode: 'US',
    countryName: 'United States',
  );

  final weatherBundle = WeatherBundle(
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

  setUpAll(() {
    registerFallbackValue(
      const GetWeatherParams(lat: 0, lon: 0, cityName: 'fallback'),
    );
    registerFallbackValue(
      const TopCitiesForCountryParams(countryCode: 'US'),
    );
  });

  setUp(() async {
    AppRouter.resetForTesting();
    await sl.reset(dispose: true);
    configureDependencies();

    mockGetWeather = MockGetWeather();
    mockGetCurrentLocation = MockGetCurrentLocation();
    mockTopCitiesForCountry = MockTopCitiesForCountry();
    when(() => mockGetWeather(any())).thenAnswer((_) async => Right(weatherBundle));
    when(() => mockGetCurrentLocation()).thenAnswer(
      (_) async => const Right(deviceLocation),
    );
    when(() => mockTopCitiesForCountry(any())).thenAnswer(
      (_) async => const Right([]),
    );

    await sl.unregister<GetWeather>();
    sl.registerFactory<GetWeather>(() => mockGetWeather);
    await sl.unregister<GetCurrentLocation>();
    sl.registerFactory<GetCurrentLocation>(() => mockGetCurrentLocation);
    await sl.unregister<TopCitiesForCountry>();
    sl.registerFactory<TopCitiesForCountry>(() => mockTopCitiesForCountry);

    sl<RemoteConfigBloc>().add(const RemoteConfigEvent.started());
  });

  testWidgets('config swap and kill-switch flip gated features end-to-end', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const WeatherApp());
    await tester.pumpAndSettle();

    final remoteConfigBloc = sl<RemoteConfigBloc>();

    remoteConfigBloc.add(
      const RemoteConfigEvent.userIdChanged(ScenarioUsers.configACompactUser),
    );
    await tester.pumpAndSettle();

    expect(find.text('Air Quality'), findsNothing);
    expect(find.text('Severe Thunderstorm Warning'), findsNothing);

    remoteConfigBloc.add(const RemoteConfigEvent.configSwitched('config_b'));
    await tester.pumpAndSettle();

    expect(find.text('Severe Thunderstorm Warning'), findsOneWidget);
    expect(find.text('Air Quality'), findsOneWidget);

    remoteConfigBloc.add(
      const RemoteConfigEvent.killSwitchToggled('severe_weather_alert', true),
    );
    await tester.pumpAndSettle();

    expect(find.text('Severe Thunderstorm Warning'), findsNothing);
    expect(find.text('Air Quality'), findsOneWidget);

    remoteConfigBloc.add(const RemoteConfigEvent.configSwitched('config_a'));
    remoteConfigBloc.add(
      const RemoteConfigEvent.userIdChanged(ScenarioUsers.configAAlternateUser),
    );
    await tester.pumpAndSettle();

    expect(find.text('Air Quality'), findsOneWidget);
    expect(find.text('Severe Thunderstorm Warning'), findsNothing);
  });
}
