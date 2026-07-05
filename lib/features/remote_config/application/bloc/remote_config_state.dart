import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';

part 'remote_config_state.freezed.dart';

@freezed
abstract class RemoteConfigState with _$RemoteConfigState {
  const RemoteConfigState._();

  const factory RemoteConfigState({
    RemoteConfig? config,
    @Default(AppConstants.defaultUserId) String userId,
    @Default(false) bool isLoading,
    Failure? failure,
    @Default(FlagEvaluator()) FlagEvaluator evaluator,
  }) = _RemoteConfigState;

  Map<String, FlagEvaluation> get evaluations {
    final activeConfig = config;
    if (activeConfig == null) {
      return const {};
    }

    return activeConfig.flags.map(
      (key, flag) => MapEntry(key, evaluator.evaluate(flag, userId)),
    );
  }

  bool isEnabled(String flagKey) => evaluations[flagKey]?.result ?? false;

  String? variantOf(String flagKey) => evaluations[flagKey]?.variant;
}
