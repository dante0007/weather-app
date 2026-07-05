import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouteNames {
  static const String dashboard = 'dashboard';
  static const String configViewer = 'config-viewer';
  static const String forecast = 'forecast';
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
          child: _ConfigViewerPlaceholderPage(),
        ),
      ),
      GoRoute(
        path: '/forecast',
        name: AppRouteNames.forecast,
        pageBuilder: (context, state) => const MaterialPage(
          child: _ForecastPlaceholderPage(),
        ),
      ),
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

class _ConfigViewerPlaceholderPage extends StatelessWidget {
  const _ConfigViewerPlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Config Viewer')),
    );
  }
}

class _ForecastPlaceholderPage extends StatelessWidget {
  const _ForecastPlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Forecast')),
    );
  }
}
