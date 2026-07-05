// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigDto _$RemoteConfigDtoFromJson(Map<String, dynamic> json) =>
    RemoteConfigDto(
      configId: json['configId'] as String,
      description: json['description'] as String,
      flags: (json['flags'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, FeatureFlagDto.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$RemoteConfigDtoToJson(RemoteConfigDto instance) =>
    <String, dynamic>{
      'configId': instance.configId,
      'description': instance.description,
      'flags': instance.flags,
    };
