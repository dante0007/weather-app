import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

part 'remote_config_event.freezed.dart';

@freezed
sealed class RemoteConfigEvent with _$RemoteConfigEvent {
  const factory RemoteConfigEvent.started() = RemoteConfigStarted;

  const factory RemoteConfigEvent.configSwitched(String configId) =
      RemoteConfigConfigSwitched;

  const factory RemoteConfigEvent.userIdChanged(String userId) =
      RemoteConfigUserIdChanged;

  const factory RemoteConfigEvent.killSwitchToggled(
    String flagKey,
    bool killed,
  ) = RemoteConfigKillSwitchToggled;

  /// Dispatched by the bloc when [RemoteConfigRepository.watchConfig] emits.
  const factory RemoteConfigEvent.configStreamUpdated(RemoteConfig config) =
      RemoteConfigConfigStreamUpdated;
}
