import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality.freezed.dart';

enum AirQualityCategory {
  good,
  moderate,
  unhealthyForSensitiveGroups,
  unhealthy,
  veryUnhealthy,
  hazardous,
}

@freezed
sealed class AirQuality with _$AirQuality {
  const factory AirQuality({
    required int aqi,
    required AirQualityCategory category,
    required String dominantPollutant,
  }) = _AirQuality;
}
