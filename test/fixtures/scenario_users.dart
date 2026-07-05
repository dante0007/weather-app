/// Scenario users chosen for deterministic FNV-1a bucket outcomes.
///
/// bucket = fnv1a32("$userId:$flagKey") % 100; included when bucket < rolloutPercentage.
abstract final class ScenarioUsers {
  /// Screen 02 · Config A · Compact.
  /// PDF label says user_42, but [configACompactUser] is used because:
  /// air_quality_card (30%): bucket 37 → OFF; hourly_forecast (50%): bucket 43 → ON.
  static const String configACompactUser = 'user_1';

  /// Screen 03 · Config A · Alternate compact.
  /// air_quality_card: bucket 17 → ON; hourly_forecast: bucket 99 → OFF.
  static const String configAAlternateUser = 'user_87';

  /// Screen 04 · Config B · Detailed — all flags ON.
  static const String configBFullUser = 'user_42';

  /// Screen 05 · Config B · Wind hidden.
  /// PDF label says user_91, but [configBWindHiddenUser] is used because
  /// wind_speed_card (80%): bucket 81 → OFF.
  static const String configBWindHiddenUser = 'user_10';

  /// Default debug / integration baseline.
  static const String defaultDebugUser = 'user_42';
}
