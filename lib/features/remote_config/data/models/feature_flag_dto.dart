import 'package:json_annotation/json_annotation.dart';

part 'feature_flag_dto.g.dart';

/// Rollout fields are flat on the flag object in JSON; nested [RolloutRule] is
/// built in [config_mapper].
@JsonSerializable()
class FeatureFlagDto {
  const FeatureFlagDto({
    required this.enabled,
    required this.killSwitch,
    required this.rolloutPercentage,
    this.variant,
  });

  factory FeatureFlagDto.fromJson(Map<String, dynamic> json) =>
      _$FeatureFlagDtoFromJson(json);

  final bool enabled;
  final bool killSwitch;
  final int rolloutPercentage;
  final String? variant;

  Map<String, dynamic> toJson() => _$FeatureFlagDtoToJson(this);
}
