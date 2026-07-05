import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';

class ToggleKillSwitchParams {
  const ToggleKillSwitchParams({
    required this.flagKey,
    required this.killed,
  });

  final String flagKey;
  final bool killed;
}

class ToggleKillSwitch implements UseCase<Unit, ToggleKillSwitchParams> {
  ToggleKillSwitch(this._repository);

  final RemoteConfigRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(ToggleKillSwitchParams params) =>
      _repository.setKillSwitch(params.flagKey, params.killed);
}
