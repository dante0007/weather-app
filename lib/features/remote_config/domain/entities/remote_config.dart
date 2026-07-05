import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';

part 'remote_config.freezed.dart';

@freezed
sealed class RemoteConfig with _$RemoteConfig {
  const RemoteConfig._();

  const factory RemoteConfig({
    required String configId,
    required String description,
    required Map<String, FeatureFlag> flags,
  }) = _RemoteConfig;

  FeatureFlag flagFor(String key) => flags[key] ?? FeatureFlag.disabled(key);
}
