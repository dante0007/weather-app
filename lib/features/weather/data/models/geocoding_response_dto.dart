import 'package:json_annotation/json_annotation.dart';

part 'geocoding_response_dto.g.dart';

@JsonSerializable()
class GeocodingResponseDto {
  const GeocodingResponseDto({this.results});

  factory GeocodingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResponseDtoFromJson(json);

  final List<GeocodingResultDto>? results;

  Map<String, dynamic> toJson() => _$GeocodingResponseDtoToJson(this);
}

@JsonSerializable()
class GeocodingResultDto {
  const GeocodingResultDto({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    this.countryCode,
  });

  factory GeocodingResultDto.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultDtoFromJson(json);

  final String name;
  final String country;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() => _$GeocodingResultDtoToJson(this);
}
