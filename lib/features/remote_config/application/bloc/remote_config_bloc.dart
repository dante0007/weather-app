import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';
import 'package:weather_app/features/remote_config/domain/usecases/get_remote_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/switch_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/toggle_kill_switch.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  RemoteConfigBloc({
    required RemoteConfigRepository repository,
    required GetRemoteConfig getRemoteConfig,
    required SwitchConfig switchConfig,
    required ToggleKillSwitch toggleKillSwitch,
    FlagEvaluator flagEvaluator = const FlagEvaluator(),
  })  : _repository = repository,
        _getRemoteConfig = getRemoteConfig,
        _switchConfig = switchConfig,
        _toggleKillSwitch = toggleKillSwitch,
        super(RemoteConfigState(evaluator: flagEvaluator)) {
    on<RemoteConfigStarted>(_onStarted);
    on<RemoteConfigConfigSwitched>(_onConfigSwitched);
    on<RemoteConfigUserIdChanged>(_onUserIdChanged);
    on<RemoteConfigKillSwitchToggled>(_onKillSwitchToggled);
  }

  final RemoteConfigRepository _repository;
  final GetRemoteConfig _getRemoteConfig;
  final SwitchConfig _switchConfig;
  final ToggleKillSwitch _toggleKillSwitch;

  Future<void> _onStarted(
    RemoteConfigStarted event,
    Emitter<RemoteConfigState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failure: null));

    final result = await _getRemoteConfig(const NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (config) => emit(
        state.copyWith(isLoading: false, config: config, failure: null),
      ),
    );

    if (result.isLeft()) {
      return;
    }

    await emit.onEach(
      _repository.watchConfig(),
      onData: (config) => state.copyWith(config: config, failure: null),
    );
  }

  Future<void> _onConfigSwitched(
    RemoteConfigConfigSwitched event,
    Emitter<RemoteConfigState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failure: null));

    final result = await _switchConfig(
      SwitchConfigParams(configId: event.configId),
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (_) => emit(state.copyWith(isLoading: false, failure: null)),
    );
  }

  void _onUserIdChanged(
    RemoteConfigUserIdChanged event,
    Emitter<RemoteConfigState> emit,
  ) {
    emit(state.copyWith(userId: event.userId));
  }

  Future<void> _onKillSwitchToggled(
    RemoteConfigKillSwitchToggled event,
    Emitter<RemoteConfigState> emit,
  ) async {
    final result = await _toggleKillSwitch(
      ToggleKillSwitchParams(flagKey: event.flagKey, killed: event.killed),
    );

    result.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (_) => emit(state.copyWith(failure: null)),
    );
  }
}
