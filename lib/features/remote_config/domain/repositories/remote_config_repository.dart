import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

abstract class RemoteConfigRepository {
  Future<Either<Failure, RemoteConfig>> getConfig();

  Stream<RemoteConfig> watchConfig();

  Future<Either<Failure, Unit>> switchConfig(String configId);

  Future<Either<Failure, Unit>> setKillSwitch(String flagKey, bool killed);
}
