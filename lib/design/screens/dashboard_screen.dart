import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/cards/severe_weather_alert_banner.dart';
import 'package:weather_app/design/components/dashboard_gated_content.dart';
import 'package:weather_app/design/components/dashboard_header.dart';
import 'package:weather_app/design/static_feature_gate.dart';
import 'package:weather_app/static/static_mock_data.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Dashboard for Config A/B and kill-switch scenarios (designs 02–07).
///
/// Config B scenarios ([StaticScenario.configBDetailedUser42],
/// [StaticScenario.configBDetailedUser91]) use the detailed [layout_variant]
/// with all gated cards. Kill-switch pair toggles the alert banner via scenario
/// config ([StaticMockData.configB] vs [StaticMockData.configBAlertKilled]).
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
  @override
  void initState() {
    super.initState();
    if (widget.scenario == StaticScenario.killSwitchAfter) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _showKillSwitchToast());
    }
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
    final data = StaticScenarioHolder.resolve(widget.scenario);
    final bundle = StaticMockData.newYorkBundle;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.padding),
            children: [
              StaticFeatureGate(
                evaluations: data.evaluations,
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
                showOtherCities: !_isConfigBDetailed(widget.scenario),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static bool _isConfigBDetailed(StaticScenario scenario) {
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
