import 'package:flutter/material.dart';

import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';

/// Gates a widget based on pre-computed static flag evaluations.
class StaticFeatureGate extends StatelessWidget {
  const StaticFeatureGate({
    required this.evaluations,
    required this.flagKey,
    required this.child,
    super.key,
  });

  final Map<String, FlagEvaluation> evaluations;
  final String flagKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (evaluations[flagKey]?.result != true) {
      return const SizedBox.shrink();
    }

    return child;
  }
}
