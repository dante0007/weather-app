import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';

class GetRemoteConfig implements UseCase<RemoteConfig, NoParams> {
  GetRemoteConfig(this._repository);

  final RemoteConfigRepository _repository;

  @override
  Future<Either<Failure, RemoteConfig>> call(NoParams params) =>
      _repository.getConfig();
}
