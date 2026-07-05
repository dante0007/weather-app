import 'package:flutter/material.dart';

import 'package:weather_app/design/screens/dashboard_screen.dart';
import 'package:weather_app/design/screens/error_screen.dart';
import 'package:weather_app/design/screens/shimmer_screen.dart';
import 'package:weather_app/design/screens/splash_screen.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Builds the static screen widget for a [StaticScenario].
abstract final class StaticScreenBuilder {
  static Widget build(StaticScenario scenario) {
    return switch (scenario) {
      StaticScenario.splash => SplashScreen(scenario: scenario),
      StaticScenario.errorFetchFailed => ErrorScreen(scenario: scenario),
      StaticScenario.shimmerLoading => ShimmerScreen(scenario: scenario),
      _ => DashboardScreen(scenario: scenario),
    };
  }

  static String label(StaticScenario scenario) {
    return switch (scenario) {
      StaticScenario.splash => '01 · App Loading / Splash',
      StaticScenario.configACompactUser42 => '02 · Config A · Compact (user_42)',
      StaticScenario.configACompactUser87 =>
        '03 · Config A · Different User (user_87)',
      StaticScenario.configBDetailedUser42 => '04 · Config B · Detailed (user_42)',
      StaticScenario.configBDetailedUser91 =>
        '05 · Config B · Wind Hidden (user_91)',
      StaticScenario.killSwitchBefore => '06 · Kill-Switch · Before',
      StaticScenario.killSwitchAfter => '07 · Kill-Switch · After',
      StaticScenario.debugPanelA => '08–09 · Debug Panel · Config A',
      StaticScenario.debugPanelB => '10 · Debug Panel · Config B',
      StaticScenario.debugPanelUserChanged => '11 · Debug Panel · User Changed',
      StaticScenario.configViewerA => '12 · Config Viewer · A JSON',
      StaticScenario.configViewerB => '13 · Config Viewer · B JSON',
      StaticScenario.errorFetchFailed => '14 · Error · Fetch Failed',
      StaticScenario.shimmerLoading => '15 · Shimmer · Loading Data',
    };
  }
}
