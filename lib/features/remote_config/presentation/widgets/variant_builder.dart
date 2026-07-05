import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';

/// Builds UI from the current rollout variant for [flagKey].
class FlagVariant extends StatelessWidget {
  const FlagVariant({
    required this.flagKey,
    required this.builder,
    super.key,
  });

  final String flagKey;
  final Widget Function(BuildContext context, String? variant) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
      buildWhen: (previous, current) =>
          previous.variantOf(flagKey) != current.variantOf(flagKey) ||
          previous.config != current.config ||
          previous.userId != current.userId,
      builder: (context, state) => builder(context, state.variantOf(flagKey)),
    );
  }
}
