import 'package:json_annotation/json_annotation.dart';

part 'air_quality_response_dto.g.dart';

@JsonSerializable()
class AirQualityResponseDto {
  const AirQualityResponseDto({required this.current});

  factory AirQualityResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityResponseDtoFromJson(json);

  final AirQualityCurrentDto current;

  Map<String, dynamic> toJson() => _$AirQualityResponseDtoToJson(this);
}

@JsonSerializable()
class AirQualityCurrentDto {
  const AirQualityCurrentDto({
    @JsonKey(name: 'us_aqi') this.usAqi,
    @JsonKey(name: 'pm2_5') this.pm25,
    @JsonKey(name: 'pm10') this.pm10,
    this.ozone,
  });

  factory AirQualityCurrentDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityCurrentDtoFromJson(json);

  final double? usAqi;
  final double? pm25;
  final double? pm10;
  final double? ozone;

  Map<String, dynamic> toJson() => _$AirQualityCurrentDtoToJson(this);
}
