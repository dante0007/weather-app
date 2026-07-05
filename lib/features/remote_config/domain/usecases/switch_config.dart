import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';

class SwitchConfigParams {
  const SwitchConfigParams({required this.configId});

  final String configId;
}

class SwitchConfig implements UseCase<Unit, SwitchConfigParams> {
  SwitchConfig(this._repository);

  final RemoteConfigRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SwitchConfigParams params) =>
      _repository.switchConfig(params.configId);
}
