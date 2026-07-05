import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/features/remote_config/data/models/feature_flag_dto.dart';

part 'remote_config_dto.g.dart';

@JsonSerializable()
class RemoteConfigDto {
  const RemoteConfigDto({
    required this.configId,
    required this.description,
    required this.flags,
  });

  factory RemoteConfigDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigDtoFromJson(json);

  final String configId;
  final String description;
  final Map<String, FeatureFlagDto> flags;

  Map<String, dynamic> toJson() => _$RemoteConfigDtoToJson(this);
}
