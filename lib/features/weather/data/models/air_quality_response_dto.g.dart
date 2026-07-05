// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityResponseDto _$AirQualityResponseDtoFromJson(
  Map<String, dynamic> json,
) => AirQualityResponseDto(
  current: AirQualityCurrentDto.fromJson(
    json['current'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AirQualityResponseDtoToJson(
  AirQualityResponseDto instance,
) => <String, dynamic>{'current': instance.current};

AirQualityCurrentDto _$AirQualityCurrentDtoFromJson(
  Map<String, dynamic> json,
) => AirQualityCurrentDto(
  usAqi: (json['us_aqi'] as num?)?.toDouble(),
  pm25: (json['pm2_5'] as num?)?.toDouble(),
  pm10: (json['pm10'] as num?)?.toDouble(),
  ozone: (json['ozone'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AirQualityCurrentDtoToJson(
  AirQualityCurrentDto instance,
) => <String, dynamic>{
  'us_aqi': instance.usAqi,
  'pm2_5': instance.pm25,
  'pm10': instance.pm10,
  'ozone': instance.ozone,
};
