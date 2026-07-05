abstract final class AppConstants {
  static const String openMeteoForecastBase = 'https://api.open-meteo.com/v1';
  static const String openMeteoAirQualityBase =
      'https://air-quality-api.open-meteo.com/v1';
  static const String openMeteoGeocodingBase =
      'https://geocoding-api.open-meteo.com/v1';

  static const String configAPath = 'assets/config/config_a.json';
  static const String configBPath = 'assets/config/config_b.json';

  static const String defaultConfigId = 'config_a';

  static const String defaultUserId = 'user_42';
  static const String defaultMockUserId = 'mock-user-001';

  /// Used when device location is unavailable so weather can still load.
  static const double fallbackLat = 40.7128;
  static const double fallbackLon = -74.006;
  static const String fallbackCityName = 'New York';
  static const String fallbackCountryCode = 'US';
}
