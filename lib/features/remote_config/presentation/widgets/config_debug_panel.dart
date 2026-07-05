import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/core/widgets/kill_switch_indicator.dart';
import 'package:weather_app/core/widgets/on_off_badge.dart';
import 'package:weather_app/core/widgets/section_label.dart';
import 'package:weather_app/core/widgets/segmented_toggle.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';
import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

class ConfigDebugPanel extends StatefulWidget {
  const ConfigDebugPanel({
    required this.onClose,
    required this.onViewRawConfig,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback onViewRawConfig;

  static const flagOrder = [
    'uv_index_card',
    'air_quality_card',
    'hourly_forecast',
    'wind_speed_card',
    'severe_weather_alert',
    'seven_day_forecast',
    'layout_variant',
  ];

  @override
  State<ConfigDebugPanel> createState() => _ConfigDebugPanelState();
}

class _ConfigDebugPanelState extends State<ConfigDebugPanel> {
  late final TextEditingController _userIdController;

  @override
  void initState() {
    super.initState();
    final userId = context.read<RemoteConfigBloc>().state.userId;
    _userIdController = TextEditingController(text: userId);
  }

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  void _reset() {
    final bloc = context.read<RemoteConfigBloc>();
    bloc.add(const RemoteConfigEvent.userIdChanged(AppConstants.defaultUserId));
    bloc.add(
      const RemoteConfigEvent.configSwitched(AppConstants.defaultConfigId),
    );
    _userIdController.text = AppConstants.defaultUserId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoteConfigBloc, RemoteConfigState>(
      listenWhen: (previous, current) => previous.userId != current.userId,
      listener: (context, state) {
        if (_userIdController.text != state.userId) {
          _userIdController.text = state.userId;
        }
      },
      child: BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
        builder: (context, state) {
          final config = state.config;
          if (config == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final evaluations = state.evaluations;
          final userChanged = state.userId != AppConstants.defaultUserId;

          return Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundBottom.withValues(alpha: 0.96),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: AppSpacing.gapSm),
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.glassBorder,
                          borderRadius: AppRadii.pill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.padding,
                          AppSpacing.gap,
                          AppSpacing.padding,
                          AppSpacing.padding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.bug_report_outlined,
                                  color: AppColors.accentAmber,
                                  size: 18,
                                ),
                                const SizedBox(width: AppSpacing.gapSm),
                                Text('Debug Panel', style: AppTypography.title),
                                const Spacer(),
                                IconButton(
                                  onPressed: widget.onClose,
                                  icon: const Icon(Icons.close, size: 20),
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.glassSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.gapLg),
                            const SectionLabel('Active Configuration'),
                            const SizedBox(height: AppSpacing.gapSm),
                            SegmentedToggle<String>(
                              selected: config.configId,
                              onChanged: (value) {
                                context.read<RemoteConfigBloc>().add(
                                      RemoteConfigEvent.configSwitched(value),
                                    );
                              },
                              accentFor: (value) => value == 'config_a'
                                  ? AppColors.accentAmber
                                  : AppColors.accentBlue,
                              options: const [
                                SegmentedToggleOption(
                                  label: 'Config A',
                                  value: 'config_a',
                                ),
                                SegmentedToggleOption(
                                  label: 'Config B',
                                  value: 'config_b',
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.gapSm),
                            _ConfigSummary(config: config),
                            const SizedBox(height: AppSpacing.gapLg),
                            const SectionLabel('User Identity'),
                            const SizedBox(height: AppSpacing.gapSm),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _userIdController,
                                    onChanged: (value) {
                                      context.read<RemoteConfigBloc>().add(
                                            RemoteConfigEvent.userIdChanged(
                                              value,
                                            ),
                                          );
                                    },
                                    style: AppTypography.subtitle.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: AppColors.glassSurface,
                                      border: OutlineInputBorder(
                                        borderRadius: AppRadii.card,
                                        borderSide: const BorderSide(
                                          color: AppColors.glassBorder,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: AppRadii.card,
                                        borderSide: const BorderSide(
                                          color: AppColors.glassBorder,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.gapSm),
                                TextButton.icon(
                                  onPressed: () {
                                    final userId =
                                        'user_${math.Random().nextInt(1000)}';
                                    context.read<RemoteConfigBloc>().add(
                                          RemoteConfigEvent.userIdChanged(
                                            userId,
                                          ),
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.casino_outlined,
                                    size: 16,
                                  ),
                                  label: const Text('Randomize'),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: AppSpacing.gapSm),
                              child: Text(
                                userChanged
                                    ? '↺ Buckets recalculated for ${state.userId}'
                                    : 'Change to see different rollout buckets.',
                                style: AppTypography.caption.copyWith(
                                  color: userChanged
                                      ? AppColors.accentAmber
                                      : AppColors.textMuted,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.gapLg),
                            const SectionLabel('Flag Evaluations'),
                            const SizedBox(height: AppSpacing.gapSm),
                            _FlagTable(
                              config: config,
                              evaluations: evaluations,
                            ),
                            const SizedBox(height: AppSpacing.gapLg),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: widget.onViewRawConfig,
                                    icon: const Icon(
                                      Icons.data_object,
                                      size: 18,
                                    ),
                                    label: const Text('View raw config'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: AppColors.accentBlue,
                                      side: const BorderSide(
                                        color: AppColors.accentBlue,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.gap),
                                OutlinedButton.icon(
                                  onPressed: _reset,
                                  icon: const Icon(Icons.refresh, size: 18),
                                  label: const Text('Reset'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.textSecondary,
                                    side: const BorderSide(
                                      color: AppColors.glassBorder,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ConfigSummary extends StatelessWidget {
  const _ConfigSummary({required this.config});

  final RemoteConfig config;

  @override
  Widget build(BuildContext context) {
    final variant =
        config.flags['layout_variant']?.rollout.variant ?? 'compact';
    final accent = config.configId == 'config_a'
        ? AppColors.accentAmber
        : AppColors.accentBlue;

    return Row(
      children: [
        const KillSwitchIndicator(isKilled: false, size: 8),
        const SizedBox(width: AppSpacing.gapSm),
        Expanded(
          child: Text(
            '${config.description} · layout $variant',
            style: AppTypography.caption.copyWith(color: accent),
          ),
        ),
      ],
    );
  }
}

class _FlagTable extends StatelessWidget {
  const _FlagTable({
    required this.config,
    required this.evaluations,
  });

  final RemoteConfig config;
  final Map<String, FlagEvaluation> evaluations;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.glassSurface,
        borderRadius: AppRadii.card,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.gap,
              vertical: AppSpacing.gapSm,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('FLAG', style: AppTypography.caption),
                ),
                Expanded(
                  child: Text('BUCKET', style: AppTypography.caption),
                ),
                Expanded(
                  child: Text('ROLLOUT', style: AppTypography.caption),
                ),
                Expanded(
                  child: Text(
                    'RESULT',
                    style: AppTypography.caption,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          for (final key in ConfigDebugPanel.flagOrder)
            _FlagRow(
              flagKey: key,
              flag: config.flagFor(key),
              evaluation: evaluations[key]!,
            ),
        ],
      ),
    );
  }
}

class _FlagRow extends StatelessWidget {
  const _FlagRow({
    required this.flagKey,
    required this.flag,
    required this.evaluation,
  });

  final String flagKey;
  final FeatureFlag flag;
  final FlagEvaluation evaluation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.gap,
        vertical: AppSpacing.gapSm,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                KillSwitchIndicator(
                  isKilled: flag.killSwitch,
                  size: 8,
                  onTap: () {
                    context.read<RemoteConfigBloc>().add(
                          RemoteConfigEvent.killSwitchToggled(
                            flagKey,
                            !flag.killSwitch,
                          ),
                        );
                  },
                ),
                const SizedBox(width: AppSpacing.gapSm),
                Expanded(
                  child: Text(
                    flagKey,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '${evaluation.bucket}',
              style: AppTypography.caption,
            ),
          ),
          Expanded(
            child: Text(
              '${evaluation.rolloutPercentage}%',
              style: AppTypography.caption,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: evaluation.variant != null
                  ? _VariantBadge(variant: evaluation.variant!)
                  : OnOffBadge(isOn: evaluation.result),
            ),
          ),
        ],
      ),
    );
  }
}

class _VariantBadge extends StatelessWidget {
  const _VariantBadge({required this.variant});

  final String variant;

  @override
  Widget build(BuildContext context) {
    final color = variant == 'detailed'
        ? AppColors.accentBlue
        : AppColors.accentAmber;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: AppRadii.pill,
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      child: Text(
        variant,
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
