import 'package:weather_app/features/remote_config/data/models/feature_flag_dto.dart';
import 'package:weather_app/features/remote_config/data/models/remote_config_dto.dart';
import 'package:weather_app/features/remote_config/data/models/rollout_rule_dto.dart';
import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';

RolloutRule mapRolloutRuleDto(RolloutRuleDto dto) {
  return RolloutRule(
    rolloutPercentage: dto.rolloutPercentage,
    variant: dto.variant,
  );
}

RolloutRule mapRolloutFromFeatureFlagDto(FeatureFlagDto dto) {
  return mapRolloutRuleDto(
    RolloutRuleDto(
      rolloutPercentage: dto.rolloutPercentage,
      variant: dto.variant,
    ),
  );
}

FeatureFlag mapFeatureFlagDto(String key, FeatureFlagDto dto) {
  return FeatureFlag(
    key: key,
    enabled: dto.enabled,
    killSwitch: dto.killSwitch,
    rollout: mapRolloutFromFeatureFlagDto(dto),
  );
}

RemoteConfig mapRemoteConfigDto(RemoteConfigDto dto) {
  return RemoteConfig(
    configId: dto.configId,
    description: dto.description,
    flags: dto.flags.map(
      (key, flagDto) => MapEntry(key, mapFeatureFlagDto(key, flagDto)),
    ),
  );
}
