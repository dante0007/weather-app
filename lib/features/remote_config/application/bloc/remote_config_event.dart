import 'package:freezed_annotation/freezed_annotation.dart';

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
}
