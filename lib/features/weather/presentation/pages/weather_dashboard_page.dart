import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/config_debug_panel.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/debug_fab.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/feature_gate.dart';
import 'package:weather_app/features/weather/application/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/application/bloc/weather_state.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_error_view.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_header.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_shimmer_view.dart';
import 'package:weather_app/features/weather/presentation/widgets/dashboard_weather_content.dart';
import 'package:weather_app/features/weather/presentation/widgets/severe_weather_alert_banner.dart';

class WeatherDashboardPage extends StatefulWidget {
  const WeatherDashboardPage({super.key});

  @override
  State<WeatherDashboardPage> createState() => _WeatherDashboardPageState();
}

class _WeatherDashboardPageState extends State<WeatherDashboardPage> {
  bool _debugSheetOpen = false;

  void _viewRawConfig() {
    context.pushNamed(AppRouteNames.configViewer);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WeatherBloc>()
        ..add(
          const WeatherEvent.loadRequested(
            lat: WeatherBloc.defaultLat,
            lon: WeatherBloc.defaultLon,
            cityName: WeatherBloc.defaultCityName,
          ),
        ),
      child: AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return switch (state) {
                    WeatherInitial() || WeatherLoading() =>
                      const DashboardShimmerView(),
                    WeatherLoaded(:final bundle) => _LoadedDashboardBody(
                        bundle: bundle,
                        debugSheetOpen: _debugSheetOpen,
                      ),
                    WeatherError(:final failure) => DashboardErrorView(
                        failure: failure,
                        onRetry: () => context.read<WeatherBloc>().add(
                              const WeatherEvent.refreshRequested(),
                            ),
                      ),
                  };
                },
              ),
              if (kDebugMode && _debugSheetOpen)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () => setState(() => _debugSheetOpen = false),
                    child: ColoredBox(
                      color: Colors.black.withValues(alpha: 0.35),
                    ),
                  ),
                ),
              if (kDebugMode && _debugSheetOpen)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: 0.78,
                    widthFactor: 1,
                    child: ConfigDebugPanel(
                      onClose: () => setState(() => _debugSheetOpen = false),
                      onViewRawConfig: _viewRawConfig,
                    ),
                  ),
                ),
              if (kDebugMode && !_debugSheetOpen)
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
      ),
    );
  }
}

class _LoadedDashboardBody extends StatelessWidget {
  const _LoadedDashboardBody({
    required this.bundle,
    required this.debugSheetOpen,
  });

  final WeatherBundle bundle;
  final bool debugSheetOpen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.padding),
        children: [
          FeatureGate(
            flagKey: 'severe_weather_alert',
            builder: (_) => const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.gap),
              child: SevereWeatherAlertBanner(),
            ),
          ),
          DashboardHeader(bundle: bundle),
          const SizedBox(height: AppSpacing.gapLg),
          DashboardWeatherContent(bundle: bundle),
          if (kDebugMode && !debugSheetOpen) const SizedBox(height: 72),
        ],
      ),
    );
  }
}
