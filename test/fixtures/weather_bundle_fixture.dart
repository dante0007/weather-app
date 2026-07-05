import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/city_weather.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

/// Canned weather bundle for tests and [FakeWeatherRepository].
abstract final class WeatherBundleFixture {
  static const String defaultCityName = 'New York';

  static final DateTime referenceDay = DateTime(2026, 7, 5);

  static const WeatherCondition mostlySunny = WeatherCondition(
    type: WeatherConditionType.partlyCloudy,
    label: 'Mostly Sunny',
    iconKey: 'partly_cloudy',
  );

  static const WeatherCondition sunny = WeatherCondition(
    type: WeatherConditionType.clear,
    label: 'Sunny',
    iconKey: 'clear',
  );

  static const WeatherCondition rainy = WeatherCondition(
    type: WeatherConditionType.rain,
    label: 'Rainy',
    iconKey: 'rain',
  );

  static const WeatherCondition thunderstorm = WeatherCondition(
    type: WeatherConditionType.thunderstorm,
    label: 'Thunderstorm',
    iconKey: 'thunderstorm',
  );

  static WeatherBundle get sampleBundle => WeatherBundle(
        cityName: defaultCityName,
        current: CurrentWeather(
          temperature: 28,
          feelsLike: 29,
          condition: mostlySunny,
          humidity: 20,
          precipitationProbability: 30,
          windSpeed: 9,
          windDirection: 315,
          uvIndex: 6,
          isDay: true,
        ),
        hourly: HourlyForecast(slots: hourlySlots),
        daily: DailyForecast(days: dailyDays),
        airQuality: const AirQuality(
          aqi: 42,
          category: AirQualityCategory.good,
          dominantPollutant: 'PM2.5',
        ),
      );

  static List<CityWeather> get sampleOtherCities => [
        CityWeather(
          city: const GeoCity(
            name: 'Los Angeles',
            country: 'United States',
            lat: 34.0522,
            lon: -118.2437,
          ),
          condition: sunny,
          temperature: 31,
        ),
        CityWeather(
          city: const GeoCity(
            name: 'Chicago',
            country: 'United States',
            lat: 41.8781,
            lon: -87.6298,
          ),
          condition: mostlySunny,
          temperature: 24,
        ),
        CityWeather(
          city: const GeoCity(
            name: 'Houston',
            country: 'United States',
            lat: 29.7604,
            lon: -95.3698,
          ),
          condition: rainy,
          temperature: 33,
        ),
        CityWeather(
          city: const GeoCity(
            name: 'Phoenix',
            country: 'United States',
            lat: 33.4484,
            lon: -112.074,
          ),
          condition: sunny,
          temperature: 38,
        ),
        CityWeather(
          city: const GeoCity(
            name: 'London',
            country: 'United Kingdom',
            lat: 51.5074,
            lon: -0.1278,
          ),
          condition: mostlySunny,
          temperature: 19,
        ),
      ];

  static List<HourSlot> get hourlySlots => List<HourSlot>.generate(
        12,
        (index) {
          final hour = 10 + index;
          final conditions = <WeatherCondition>[
            mostlySunny,
            mostlySunny,
            mostlySunny,
            mostlySunny,
            rainy,
            rainy,
            thunderstorm,
            mostlySunny,
            mostlySunny,
            mostlySunny,
            mostlySunny,
            mostlySunny,
          ];
          final temperatures = <double>[
            28,
            28,
            27,
            26,
            26,
            25,
            25,
            26,
            27,
            27,
            26,
            25,
          ];

          return HourSlot(
            time: DateTime(
              referenceDay.year,
              referenceDay.month,
              referenceDay.day,
              hour,
            ),
            temperature: temperatures[index],
            condition: conditions[index],
            precipitationProbability: index >= 4 && index <= 6 ? 60 : 20,
          );
        },
      );

  static List<DaySlot> get dailyDays => List<DaySlot>.generate(
        7,
        (index) {
          final conditions = <WeatherCondition>[
            mostlySunny,
            mostlySunny,
            rainy,
            rainy,
            mostlySunny,
            sunny,
            mostlySunny,
          ];
          final highs = <double>[23, 24, 22, 21, 25, 27, 26];
          final lows = <double>[17, 18, 16, 15, 17, 19, 18];

          return DaySlot(
            date: DateTime(
              referenceDay.year,
              referenceDay.month,
              referenceDay.day + index,
            ),
            condition: conditions[index],
            tempMax: highs[index],
            tempMin: lows[index],
          );
        },
      );
}
