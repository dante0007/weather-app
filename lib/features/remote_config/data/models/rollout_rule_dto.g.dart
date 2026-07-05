// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rollout_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolloutRuleDto _$RolloutRuleDtoFromJson(Map<String, dynamic> json) =>
    RolloutRuleDto(
      rolloutPercentage: (json['rolloutPercentage'] as num).toInt(),
      variant: json['variant'] as String?,
    );

Map<String, dynamic> _$RolloutRuleDtoToJson(RolloutRuleDto instance) =>
    <String, dynamic>{
      'rolloutPercentage': instance.rolloutPercentage,
      'variant': instance.variant,
    };
