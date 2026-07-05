// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureFlagDto _$FeatureFlagDtoFromJson(Map<String, dynamic> json) =>
    FeatureFlagDto(
      enabled: json['enabled'] as bool,
      killSwitch: json['killSwitch'] as bool,
      rolloutPercentage: (json['rolloutPercentage'] as num).toInt(),
      variant: json['variant'] as String?,
    );

Map<String, dynamic> _$FeatureFlagDtoToJson(FeatureFlagDto instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'killSwitch': instance.killSwitch,
      'rolloutPercentage': instance.rolloutPercentage,
      'variant': instance.variant,
    };
