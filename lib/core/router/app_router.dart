import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/core/router/remote_config_router_refresh.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/presentation/pages/config_viewer_page.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/presentation/pages/seven_day_forecast_page.dart';
import 'package:weather_app/features/weather/presentation/pages/weather_dashboard_page.dart';

abstract final class AppRouteNames {
  static const String dashboard = 'dashboard';
  static const String configViewer = 'config-viewer';
  static const String forecast = 'forecast';
}

abstract final class AppRouter {
  static RemoteConfigRouterRefresh? _refresh;
  static GoRouter? _router;

  static GoRouter get router {
    _refresh ??= RemoteConfigRouterRefresh()
      ..attach(sl<RemoteConfigBloc>());
    return _router ??= GoRouter(
      refreshListenable: _refresh,
      redirect: _redirect,
      routes: _routes,
    );
  }

  /// Clears cached router state between tests.
  @visibleForTesting
  static void resetForTesting() {
    _refresh?.reset();
    _refresh = null;
    _router = null;
  }

  static String? _redirect(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == '/forecast') {
      if (!sl<RemoteConfigBloc>().state.isEnabled('seven_day_forecast')) {
        return '/';
      }

      if (state.extra is! WeatherBundle) {
        return '/';
      }
    }

    return null;
  }

  static final List<RouteBase> _routes = [
    GoRoute(
      path: '/',
      name: AppRouteNames.dashboard,
      pageBuilder: (context, state) => const MaterialPage(
        child: WeatherDashboardPage(),
      ),
    ),
    GoRoute(
      path: '/config-viewer',
      name: AppRouteNames.configViewer,
      pageBuilder: (context, state) => const MaterialPage(
        child: ConfigViewerPage(),
      ),
    ),
    GoRoute(
      path: '/forecast',
      name: AppRouteNames.forecast,
      pageBuilder: (context, state) {
        final bundle = state.extra! as WeatherBundle;

        return MaterialPage(
          child: SevenDayForecastPage(bundle: bundle),
        );
      },
    ),
  ];
}
