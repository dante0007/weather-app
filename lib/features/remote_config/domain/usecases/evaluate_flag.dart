import 'package:fpdart/fpdart.dart';

import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';

class EvaluateFlagParams {
  const EvaluateFlagParams({
    required this.flagKey,
    required this.userId,
  });

  final String flagKey;
  final String userId;
}

class EvaluateFlag implements UseCase<FlagEvaluation, EvaluateFlagParams> {
  EvaluateFlag(this._repository, this._evaluator);

  final RemoteConfigRepository _repository;
  final FlagEvaluator _evaluator;

  @override
  Future<Either<Failure, FlagEvaluation>> call(
    EvaluateFlagParams params,
  ) async {
    final configResult = await _repository.getConfig();
    return configResult.map(
      (config) => _evaluator.evaluate(
        config.flagFor(params.flagKey),
        params.userId,
      ),
    );
  }
}
