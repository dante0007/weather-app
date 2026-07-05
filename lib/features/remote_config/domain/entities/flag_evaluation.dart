import 'package:freezed_annotation/freezed_annotation.dart';

part 'flag_evaluation.freezed.dart';

@freezed
sealed class FlagEvaluation with _$FlagEvaluation {
  const factory FlagEvaluation({
    required String flagKey,
    required int bucket,
    required int rolloutPercentage,
    required bool killSwitch,
    required bool enabled,
    required bool result,
    String? variant,
    required String reason,
  }) = _FlagEvaluation;
}
