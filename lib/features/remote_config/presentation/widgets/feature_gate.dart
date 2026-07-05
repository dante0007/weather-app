import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/theme/app_theme.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';

class FeatureGate extends StatelessWidget {
  const FeatureGate({
    required this.flagKey,
    required this.builder,
    this.fallback,
    this.showDebugBadge = false,
    super.key,
  });

  final String flagKey;
  final WidgetBuilder builder;
  final WidgetBuilder? fallback;
  final bool showDebugBadge;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
      buildWhen: (previous, current) =>
          previous.isEnabled(flagKey) != current.isEnabled(flagKey) ||
          previous.config != current.config ||
          previous.userId != current.userId,
      builder: (context, state) {
        final enabled = state.isEnabled(flagKey);

        if (!enabled) {
          return fallback?.call(context) ?? const SizedBox.shrink();
        }

        final child = builder(context);

        if (!showDebugBadge) {
          return child;
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            child,
            Positioned(
              top: 4,
              right: 4,
              child: _DebugFlagBadge(flagKey: flagKey),
            ),
          ],
        );
      },
    );
  }
}

class _DebugFlagBadge extends StatelessWidget {
  const _DebugFlagBadge({required this.flagKey});

  final String flagKey;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.accentGreen.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.glassBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(
          flagKey,
          style: AppTheme.caption.copyWith(
            color: AppTheme.background,
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
