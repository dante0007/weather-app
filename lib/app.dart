import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/core/router/app_router.dart';
import 'package:weather_app/core/theme/app_theme.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteConfigBloc>.value(
      value: sl<RemoteConfigBloc>(),
      child: MaterialApp.router(
        title: 'Weather Flags',
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
