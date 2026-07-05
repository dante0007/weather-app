import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

/// Evaluates flags for static scenarios using the production [FlagEvaluator].
abstract final class StaticFlagEvaluator {
  static const FlagEvaluator _evaluator = FlagEvaluator();

  static Map<String, FlagEvaluation> evaluateAll(
    RemoteConfig config,
    String userId, {
    FlagEvaluator evaluator = _evaluator,
  }) {
    return {
      for (final entry in config.flags.entries)
        entry.key: evaluator.evaluate(entry.value, userId),
    };
  }

  static FlagEvaluation evaluate(
    RemoteConfig config,
    String flagKey,
    String userId, {
    FlagEvaluator evaluator = _evaluator,
  }) {
    return evaluator.evaluate(config.flagFor(flagKey), userId);
  }
}
