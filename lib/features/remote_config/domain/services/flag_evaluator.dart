import 'dart:convert';

import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';

/// Deterministic flag evaluation using percentage-based rollout bucketing.
class FlagEvaluator {
  const FlagEvaluator();

  /// Maps a user and flag key to a stable bucket in [0, 99].
  ///
  /// Uses FNV-1a 32-bit over UTF-8 bytes of `"$userId:$flagKey"`.
  /// FNV-1a is self-contained (no crypto dependency) and produces an
  /// even distribution across buckets when reduced modulo 100.
  int computeBucket(String userId, String flagKey) {
    final hash = _fnv1a32(utf8.encode('$userId:$flagKey'));
    return hash % 100;
  }

  FlagEvaluation evaluate(FeatureFlag flag, String userId) {
    final bucket = computeBucket(userId, flag.key);
    final rolloutPercentage = flag.rollout.rolloutPercentage;
    final variant = flag.rollout.variant;

    if (flag.killSwitch) {
      return FlagEvaluation(
        flagKey: flag.key,
        bucket: bucket,
        rolloutPercentage: rolloutPercentage,
        killSwitch: true,
        enabled: flag.enabled,
        result: false,
        variant: variant,
        reason: 'killed by kill-switch',
      );
    }

    if (!flag.enabled) {
      return FlagEvaluation(
        flagKey: flag.key,
        bucket: bucket,
        rolloutPercentage: rolloutPercentage,
        killSwitch: false,
        enabled: false,
        result: false,
        variant: variant,
        reason: 'flag disabled',
      );
    }

    final included = bucket < rolloutPercentage;
    return FlagEvaluation(
      flagKey: flag.key,
      bucket: bucket,
      rolloutPercentage: rolloutPercentage,
      killSwitch: false,
      enabled: true,
      result: included,
      variant: variant,
      reason: included
          ? 'bucket $bucket < $rolloutPercentage%, included'
          : 'bucket $bucket >= $rolloutPercentage%, excluded',
    );
  }

  static int _fnv1a32(List<int> bytes) {
    const fnvPrime = 0x01000193;
    var hash = 0x811c9dc5;

    for (final byte in bytes) {
      hash ^= byte;
      hash = (hash * fnvPrime) & 0xFFFFFFFF;
    }

    return hash;
  }
}
