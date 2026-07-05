import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

/// Hardcoded domain entities for the static-UI phase.
///
/// Same types the real blocs emit — widgets swap data sources later, not shapes.
abstract final class StaticMockData {
  static const String defaultCityName = 'New York';

  /// Design screen 02 labels [user_42], but FNV buckets give air ON + hourly ON.
  /// [user_1] yields air OFF (bucket 37) + hourly ON (bucket 43) on config_a.
  static const String userIdConfigACompact = 'user_1';

  /// Design screen 03 — buckets match: air ON (17), hourly OFF (99).
  static const String userIdConfigAAlternate = 'user_87';

  /// Design screen 04 — every flag ON on config_b.
  static const String userIdConfigBFull = 'user_42';

  /// Design screen 05 labels [user_91], but wind bucket 58 < 80% rollout.
  /// [user_10] has wind bucket 81, excluded from the 80% rollout.
  static const String userIdConfigBWindHidden = 'user_10';

  static final DateTime _referenceDay = DateTime(2026, 7, 5);

  static const WeatherCondition _mostlySunny = WeatherCondition(
    type: WeatherConditionType.partlyCloudy,
    label: 'Mostly Sunny',
    iconKey: 'partly_cloudy',
  );

  static const WeatherCondition _sunny = WeatherCondition(
    type: WeatherConditionType.clear,
    label: 'Sunny',
    iconKey: 'clear',
  );

  static const WeatherCondition _rainy = WeatherCondition(
    type: WeatherConditionType.rain,
    label: 'Rainy',
    iconKey: 'rain',
  );

  static const WeatherCondition _thunderstorm = WeatherCondition(
    type: WeatherConditionType.thunderstorm,
    label: 'Thunderstorm',
    iconKey: 'thunderstorm',
  );

  static WeatherBundle get newYorkBundle => WeatherBundle(
        cityName: defaultCityName,
        current: CurrentWeather(
          temperature: 28,
          feelsLike: 29,
          condition: _mostlySunny,
          humidity: 20,
          precipitationProbability: 30,
          windSpeed: 9,
          windDirection: 315,
          uvIndex: 6,
          isDay: true,
        ),
        hourly: HourlyForecast(slots: _newYorkHourlySlots),
        daily: DailyForecast(days: _newYorkDailyDays),
        airQuality: const AirQuality(
          aqi: 42,
          category: AirQualityCategory.good,
          dominantPollutant: 'PM2.5',
        ),
      );

  static List<HourSlot> get _newYorkHourlySlots => List<HourSlot>.generate(
        12,
        (index) {
          final hour = 10 + index;
          final conditions = <WeatherCondition>[
            _mostlySunny,
            _mostlySunny,
            _mostlySunny,
            _mostlySunny,
            _rainy,
            _rainy,
            _thunderstorm,
            _mostlySunny,
            _mostlySunny,
            _mostlySunny,
            _mostlySunny,
            _mostlySunny,
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
              _referenceDay.year,
              _referenceDay.month,
              _referenceDay.day,
              hour,
            ),
            temperature: temperatures[index],
            condition: conditions[index],
            precipitationProbability: index >= 4 && index <= 6 ? 60 : 20,
          );
        },
      );

  static List<DaySlot> get _newYorkDailyDays => List<DaySlot>.generate(
        7,
        (index) {
          final conditions = <WeatherCondition>[
            _mostlySunny,
            _mostlySunny,
            _rainy,
            _rainy,
            _mostlySunny,
            _sunny,
            _mostlySunny,
          ];
          final highs = <double>[23, 24, 22, 21, 25, 27, 26];
          final lows = <double>[17, 18, 16, 15, 17, 19, 18];

          return DaySlot(
            date: DateTime(
              _referenceDay.year,
              _referenceDay.month,
              _referenceDay.day + index,
            ),
            condition: conditions[index],
            tempMax: highs[index],
            tempMin: lows[index],
          );
        },
      );

  /// Mirrors [assets/config/config_a.json] exactly.
  static const RemoteConfig configA = RemoteConfig(
    configId: 'config_a',
    description: 'Conservative rollout',
    flags: {
      'uv_index_card': FeatureFlag(
        key: 'uv_index_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'air_quality_card': FeatureFlag(
        key: 'air_quality_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 30),
      ),
      'hourly_forecast': FeatureFlag(
        key: 'hourly_forecast',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 50),
      ),
      'wind_speed_card': FeatureFlag(
        key: 'wind_speed_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 0),
      ),
      'severe_weather_alert': FeatureFlag(
        key: 'severe_weather_alert',
        enabled: true,
        killSwitch: true,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'layout_variant': FeatureFlag(
        key: 'layout_variant',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100, variant: 'compact'),
      ),
    },
  );

  /// Mirrors [assets/config/config_b.json] exactly.
  static const RemoteConfig configB = RemoteConfig(
    configId: 'config_b',
    description: 'Full features',
    flags: {
      'uv_index_card': FeatureFlag(
        key: 'uv_index_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'air_quality_card': FeatureFlag(
        key: 'air_quality_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'hourly_forecast': FeatureFlag(
        key: 'hourly_forecast',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'wind_speed_card': FeatureFlag(
        key: 'wind_speed_card',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 80),
      ),
      'severe_weather_alert': FeatureFlag(
        key: 'severe_weather_alert',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
      'layout_variant': FeatureFlag(
        key: 'layout_variant',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100, variant: 'detailed'),
      ),
    },
  );

  /// Config B with [severe_weather_alert] kill-switch engaged (design screen 07).
  static RemoteConfig get configBAlertKilled => configB.copyWith(
        flags: {
          ...configB.flags,
          'severe_weather_alert': configB.flags['severe_weather_alert']!
              .copyWith(killSwitch: true),
        },
      );
}
