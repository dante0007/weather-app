import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';

/// Mirrors [assets/config/config_a.json] for tests and widget scenarios.
abstract final class ConfigFixtures {
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
      'seven_day_forecast': FeatureFlag(
        key: 'seven_day_forecast',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 0),
      ),
    },
  );

  /// Mirrors [assets/config/config_b.json].
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
      'seven_day_forecast': FeatureFlag(
        key: 'seven_day_forecast',
        enabled: true,
        killSwitch: false,
        rollout: RolloutRule(rolloutPercentage: 100),
      ),
    },
  );

  static RemoteConfig get configBAlertKilled => configB.copyWith(
        flags: {
          ...configB.flags,
          'severe_weather_alert': configB.flags['severe_weather_alert']!
              .copyWith(killSwitch: true),
        },
      );
}
