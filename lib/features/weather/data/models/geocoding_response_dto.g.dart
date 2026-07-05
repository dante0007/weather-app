// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingResponseDto _$GeocodingResponseDtoFromJson(
  Map<String, dynamic> json,
) => GeocodingResponseDto(
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => GeocodingResultDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GeocodingResponseDtoToJson(
  GeocodingResponseDto instance,
) => <String, dynamic>{'results': instance.results};

GeocodingResultDto _$GeocodingResultDtoFromJson(Map<String, dynamic> json) =>
    GeocodingResultDto(
      name: json['name'] as String,
      country: json['country'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$GeocodingResultDtoToJson(GeocodingResultDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'country_code': instance.countryCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
