import 'package:flutter/material.dart';

import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  sl<RemoteConfigBloc>().add(const RemoteConfigEvent.started());
  runApp(const WeatherApp());
}
