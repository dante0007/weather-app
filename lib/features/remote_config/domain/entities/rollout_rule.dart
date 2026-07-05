import 'package:freezed_annotation/freezed_annotation.dart';

part 'rollout_rule.freezed.dart';

@freezed
sealed class RolloutRule with _$RolloutRule {
  const factory RolloutRule({
    required int rolloutPercentage,
    String? variant,
  }) = _RolloutRule;
}
