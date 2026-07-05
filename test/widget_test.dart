import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';

class MockGetWeather extends Mock implements GetWeather {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetWeather mockGetWeather;

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

  setUpAll(() {
    registerFallbackValue(
      const GetWeatherParams(lat: 0, lon: 0, cityName: 'fallback'),
    );
  });

  setUp(() async {
    AppRouter.resetForTesting();
    await sl.reset(dispose: true);
    configureDependencies();

    mockGetWeather = MockGetWeather();
    when(() => mockGetWeather(any())).thenAnswer((_) async => Right(bundle));

    await sl.unregister<GetWeather>();
    sl.registerFactory<GetWeather>(() => mockGetWeather);

    sl<RemoteConfigBloc>().add(const RemoteConfigEvent.started());
  });

  testWidgets('shows weather dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherApp());
    await tester.pumpAndSettle();

    expect(find.text('New York'), findsOneWidget);
    verify(() => mockGetWeather(any())).called(1);
  });
}
