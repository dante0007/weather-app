import 'dart:async';

import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/remote_config/data/datasources/remote_config_local_source.dart';
import 'package:weather_app/features/remote_config/data/mappers/config_mapper.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  RemoteConfigRepositoryImpl(this._localSource);

  final RemoteConfigLocalSource _localSource;
  final StreamController<RemoteConfig> _controller =
      StreamController<RemoteConfig>.broadcast();

  RemoteConfig? _activeConfig;

  @override
  Future<Either<Failure, RemoteConfig>> getConfig() async {
    if (_activeConfig != null) {
      return Right(_activeConfig!);
    }

    final result = await switchConfig('config_a');
    return result.fold(
      Left.new,
      (_) => Right(_activeConfig!),
    );
  }

  @override
  Stream<RemoteConfig> watchConfig() => _controller.stream;

  @override
  Future<Either<Failure, Unit>> switchConfig(String configId) async {
    try {
      final dto = await _localSource.loadConfig(configId);
      final config = mapRemoteConfigDto(dto);
      _activeConfig = config;
      _controller.add(config);
      return const Right(unit);
    } on ConfigParseException catch (error) {
      return Left(
        Failure.configParseFailure(error.message ?? 'config parse error'),
      );
    } catch (error) {
      return Left(Failure.unknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setKillSwitch(
    String flagKey,
    bool killed,
  ) async {
    final activeConfig = _activeConfig;
    if (activeConfig == null) {
      final loadResult = await getConfig();
      if (loadResult.isLeft()) {
        return loadResult.map((_) => unit);
      }
    }

    final config = _activeConfig;
    if (config == null) {
      return const Left(Failure.cacheFailure());
    }

    final flag = config.flags[flagKey];
    if (flag == null) {
      return Left(
        Failure.unknownFailure('Unknown flag key: $flagKey'),
      );
    }

    final updatedConfig = config.copyWith(
      flags: {
        ...config.flags,
        flagKey: flag.copyWith(killSwitch: killed),
      },
    );

    _activeConfig = updatedConfig;
    _controller.add(updatedConfig);
    return const Right(unit);
  }

  void dispose() {
    unawaited(_controller.close());
  }
}
