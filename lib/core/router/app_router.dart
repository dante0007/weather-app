import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:weather_app/design/design_index_page.dart';
import 'package:weather_app/design/gallery_page.dart';
import 'package:weather_app/design/screens/config_viewer_screen.dart';
import 'package:weather_app/design/screens/seven_day_forecast_screen.dart';
import 'package:weather_app/static/static_scenario.dart';

abstract final class AppRouteNames {
  static const String dashboard = 'dashboard';
  static const String configViewer = 'config-viewer';
  static const String forecast = 'forecast';
  static const String designGallery = 'design-gallery';
  static const String designIndex = 'design-index';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteNames.dashboard,
        pageBuilder: (context, state) => const MaterialPage(
          child: _DashboardPlaceholderPage(),
        ),
      ),
      GoRoute(
        path: '/config-viewer',
        name: AppRouteNames.configViewer,
        pageBuilder: (context, state) => const MaterialPage(
          child: ConfigViewerScreen(
            scenario: StaticScenario.configViewerA,
          ),
        ),
      ),
      GoRoute(
        path: '/forecast',
        name: AppRouteNames.forecast,
        pageBuilder: (context, state) => const MaterialPage(
          child: SevenDayForecastScreen(),
        ),
      ),
      if (kDebugMode) ...[
        GoRoute(
          path: '/design-gallery',
          name: AppRouteNames.designGallery,
          pageBuilder: (context, state) => const MaterialPage(
            child: DesignGalleryPage(),
          ),
        ),
        GoRoute(
          path: '/design-index',
          name: AppRouteNames.designIndex,
          pageBuilder: (context, state) => const MaterialPage(
            child: DesignIndexPage(),
          ),
        ),
      ],
    ],
  );
}

class _DashboardPlaceholderPage extends StatelessWidget {
  const _DashboardPlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Dashboard')),
    );
  }
}
