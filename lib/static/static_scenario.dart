import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/remote_config/domain/entities/flag_evaluation.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/weather/application/bloc/weather_state.dart';
import 'package:weather_app/static/static_flag_evaluator.dart';
import 'package:weather_app/static/static_mock_data.dart';

/// Design screens from `Weather States_compressed.pdf`, one enum per frame.
enum StaticScenario {
  splash,
  configACompactUser42,
  configACompactUser87,
  configBDetailedUser42,
  configBDetailedUser91,
  killSwitchBefore,
  killSwitchAfter,
  debugPanelA,
  debugPanelB,
  debugPanelUserChanged,
  configViewerA,
  configViewerB,
  errorFetchFailed,
  shimmerLoading,
}

/// Resolved inputs for rendering a single design screen deterministically.
class StaticScenarioData {
  const StaticScenarioData({
    required this.scenario,
    required this.config,
    required this.userId,
    required this.weatherState,
    required this.evaluations,
    this.isRemoteConfigLoading = false,
    this.remoteConfigFailure,
  });

  final StaticScenario scenario;
  final RemoteConfig? config;
  final String userId;
  final WeatherState weatherState;
  final Map<String, FlagEvaluation> evaluations;
  final bool isRemoteConfigLoading;
  final Failure? remoteConfigFailure;
}

/// Maps each [StaticScenario] to config, user, weather, and flag evaluations.
abstract final class StaticScenarioHolder {
  static StaticScenarioData resolve(StaticScenario scenario) {
    return switch (scenario) {
      StaticScenario.splash => StaticScenarioData(
          scenario: scenario,
          config: null,
          userId: AppConstants.defaultUserId,
          weatherState: const WeatherState.initial(),
          evaluations: const {},
          isRemoteConfigLoading: true,
        ),
      StaticScenario.configACompactUser42 => _dashboard(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: StaticMockData.userIdConfigACompact,
        ),
      StaticScenario.configACompactUser87 => _dashboard(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: StaticMockData.userIdConfigAAlternate,
        ),
      StaticScenario.configBDetailedUser42 => _dashboard(
          scenario: scenario,
          config: StaticMockData.configB,
          userId: StaticMockData.userIdConfigBFull,
        ),
      StaticScenario.configBDetailedUser91 => _dashboard(
          scenario: scenario,
          config: StaticMockData.configB,
          userId: StaticMockData.userIdConfigBWindHidden,
        ),
      StaticScenario.killSwitchBefore => _dashboard(
          scenario: scenario,
          config: StaticMockData.configB,
          userId: StaticMockData.userIdConfigBFull,
        ),
      StaticScenario.killSwitchAfter => _dashboard(
          scenario: scenario,
          config: StaticMockData.configBAlertKilled,
          userId: StaticMockData.userIdConfigBFull,
        ),
      StaticScenario.debugPanelA => _dashboard(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: AppConstants.defaultUserId,
        ),
      StaticScenario.debugPanelB => _dashboard(
          scenario: scenario,
          config: StaticMockData.configB,
          userId: AppConstants.defaultUserId,
        ),
      StaticScenario.debugPanelUserChanged => _dashboard(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: StaticMockData.userIdConfigAAlternate,
        ),
      StaticScenario.configViewerA => _dashboard(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: AppConstants.defaultUserId,
        ),
      StaticScenario.configViewerB => _dashboard(
          scenario: scenario,
          config: StaticMockData.configB,
          userId: AppConstants.defaultUserId,
        ),
      StaticScenario.errorFetchFailed => StaticScenarioData(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: AppConstants.defaultUserId,
          weatherState: WeatherState.loaded(StaticMockData.newYorkBundle),
          evaluations: StaticFlagEvaluator.evaluateAll(
            StaticMockData.configA,
            AppConstants.defaultUserId,
          ),
          remoteConfigFailure: const Failure.networkFailure(),
        ),
      StaticScenario.shimmerLoading => StaticScenarioData(
          scenario: scenario,
          config: StaticMockData.configA,
          userId: AppConstants.defaultUserId,
          weatherState: const WeatherState.loading(),
          evaluations: StaticFlagEvaluator.evaluateAll(
            StaticMockData.configA,
            AppConstants.defaultUserId,
          ),
        ),
    };
  }

  static StaticScenarioData _dashboard({
    required StaticScenario scenario,
    required RemoteConfig config,
    required String userId,
  }) {
    return StaticScenarioData(
      scenario: scenario,
      config: config,
      userId: userId,
      weatherState: WeatherState.loaded(StaticMockData.newYorkBundle),
      evaluations: StaticFlagEvaluator.evaluateAll(config, userId),
    );
  }
}
