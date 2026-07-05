import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';

part 'feature_flag.freezed.dart';

@freezed
sealed class FeatureFlag with _$FeatureFlag {
  const factory FeatureFlag({
    required String key,
    required bool enabled,
    required bool killSwitch,
    required RolloutRule rollout,
  }) = _FeatureFlag;

  factory FeatureFlag.disabled(String key) => FeatureFlag(
        key: key,
        enabled: false,
        killSwitch: false,
        rollout: const RolloutRule(rolloutPercentage: 0),
      );
}
