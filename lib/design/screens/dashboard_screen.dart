import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/config_debug_panel.dart';
import 'package:weather_app/design/components/dashboard_gated_content.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/debug_fab.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_header.dart';
import 'package:weather_app/features/weather/presentation/widgets/severe_weather_alert_banner.dart';
import 'package:weather_app/design/screens/config_viewer_screen.dart';
import 'package:weather_app/design/static_feature_gate.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/static/static_flag_evaluator.dart';
import 'package:weather_app/static/static_mock_data.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Dashboard for Config A/B, kill-switch, and debug scenarios (designs 02–11).
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    required this.scenario,
    super.key,
  });

  final StaticScenario scenario;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late RemoteConfig _config;
  late String _userId;
  late RemoteConfig _seedConfig;
  late String _seedUserId;
  late bool _debugSheetOpen;

  @override
  void initState() {
    super.initState();
    final seed = StaticScenarioHolder.resolve(widget.scenario);
    _seedConfig = seed.config!;
    _seedUserId = seed.userId;
    _config = _seedConfig;
    _userId = _seedUserId;
    _debugSheetOpen = _opensDebugSheetInitially(widget.scenario);

    if (widget.scenario == StaticScenario.killSwitchAfter) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _showKillSwitchToast());
    }
  }

  bool get _isDebugScenario => _isDebugScenarioFor(widget.scenario);

  static bool _isDebugScenarioFor(StaticScenario scenario) {
    return switch (scenario) {
      StaticScenario.debugFabCollapsed ||
      StaticScenario.debugPanelA ||
      StaticScenario.debugPanelB ||
      StaticScenario.debugPanelUserChanged =>
        true,
      _ => false,
    };
  }

  static bool _opensDebugSheetInitially(StaticScenario scenario) {
    return switch (scenario) {
      StaticScenario.debugPanelA ||
      StaticScenario.debugPanelB ||
      StaticScenario.debugPanelUserChanged =>
        true,
      _ => false,
    };
  }

  Map<String, FlagEvaluation> get _evaluations =>
      StaticFlagEvaluator.evaluateAll(_config, _userId);

  StaticScenarioData get _dashboardData {
    final seed = StaticScenarioHolder.resolve(widget.scenario);
    return StaticScenarioData(
      scenario: widget.scenario,
      config: _config,
      userId: _userId,
      weatherState: seed.weatherState,
      evaluations: _evaluations,
    );
  }

  void _resetDebugState() {
    setState(() {
      _config = _seedConfig;
      _userId = _seedUserId;
    });
  }

  void _viewRawConfig() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ConfigViewerScreen(
          scenario: _config.configId == 'config_a'
              ? StaticScenario.configViewerA
              : StaticScenario.configViewerB,
        ),
      ),
    );
  }

  void _showKillSwitchToast() {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.accentAlert.withValues(alpha: 0.92),
        content: const Row(
          children: [
            Icon(Icons.circle, color: AppColors.textPrimary, size: 10),
            SizedBox(width: AppSpacing.gapSm),
            Text('severe_weather_alert killed'),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bundle = StaticMockData.newYorkBundle;
    final data = _isDebugScenario ? _dashboardData : StaticScenarioHolder.resolve(widget.scenario);
    final evaluations = data.evaluations;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.padding),
                children: [
                  StaticFeatureGate(
                    evaluations: evaluations,
                    flagKey: 'severe_weather_alert',
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: AppSpacing.gap),
                      child: SevereWeatherAlertBanner(),
                    ),
                  ),
                  DashboardHeader(bundle: bundle),
                  const SizedBox(height: AppSpacing.gapLg),
                  DashboardGatedContent(
                    data: data,
                    bundle: bundle,
                    showOtherCities: !_isConfigBDetailed(widget.scenario, _config),
                  ),
                  if (_isDebugScenario && !_debugSheetOpen)
                    const SizedBox(height: 72),
                ],
              ),
            ),
            if (_debugSheetOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => setState(() => _debugSheetOpen = false),
                  child: ColoredBox(
                    color: Colors.black.withValues(alpha: 0.35),
                  ),
                ),
              ),
            if (_isDebugScenario && _debugSheetOpen)
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.78,
                  widthFactor: 1,
                  child: ConfigDebugPanel(
                    config: _config,
                    userId: _userId,
                    seedConfig: _seedConfig,
                    seedUserId: _seedUserId,
                    onConfigChanged: (config) => setState(() => _config = config),
                    onUserIdChanged: (userId) => setState(() => _userId = userId),
                    onReset: _resetDebugState,
                    onViewRawConfig: _viewRawConfig,
                    onClose: () => setState(() => _debugSheetOpen = false),
                  ),
                ),
              ),
            if (_isDebugScenario && !_debugSheetOpen)
              Positioned(
                right: AppSpacing.padding,
                bottom: AppSpacing.padding,
                child: DebugFab(
                  onPressed: () => setState(() => _debugSheetOpen = true),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static bool _isConfigBDetailed(
    StaticScenario scenario,
    RemoteConfig config,
  ) {
    if (_isDebugScenarioFor(scenario)) {
      return config.configId == 'config_b';
    }

    return switch (scenario) {
      StaticScenario.configBDetailedUser42 ||
      StaticScenario.configBDetailedUser91 ||
      StaticScenario.killSwitchBefore ||
      StaticScenario.killSwitchAfter =>
        true,
      _ => false,
    };
  }
}
