import 'package:json_annotation/json_annotation.dart';

part 'rollout_rule_dto.g.dart';

@JsonSerializable()
class RolloutRuleDto {
  const RolloutRuleDto({
    required this.rolloutPercentage,
    this.variant,
  });

  factory RolloutRuleDto.fromJson(Map<String, dynamic> json) =>
      _$RolloutRuleDtoFromJson(json);

  final int rolloutPercentage;
  final String? variant;

  Map<String, dynamic> toJson() => _$RolloutRuleDtoToJson(this);
}
