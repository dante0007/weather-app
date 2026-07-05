import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/data/datasources/remote_config_local_source.dart';
import 'package:weather_app/features/remote_config/data/repositories/remote_config_repository_impl.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';
import 'package:weather_app/features/remote_config/domain/usecases/evaluate_flag.dart';
import 'package:weather_app/features/remote_config/domain/usecases/get_remote_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/switch_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/toggle_kill_switch.dart';
import 'package:weather_app/features/weather/application/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/search_city.dart';

final sl = GetIt.instance;

void configureDependencies() {
  if (sl.isRegistered<Dio>()) {
    return;
  }

  sl.registerLazySingleton<Dio>(createWeatherDio);

  sl.registerLazySingleton<ForecastApiClient>(() => ForecastApiClient(sl()));
  sl.registerLazySingleton<AirQualityApiClient>(() => AirQualityApiClient(sl()));
  sl.registerLazySingleton<GeocodingApiClient>(() => GeocodingApiClient(sl()));

  sl.registerLazySingleton<RemoteConfigLocalSource>(
    () => const RemoteConfigLocalSource(),
  );

  sl.registerLazySingleton<RemoteConfigRepository>(
    () => RemoteConfigRepositoryImpl(sl()),
    dispose: (repository) =>
        (repository as RemoteConfigRepositoryImpl).dispose(),
  );

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      forecastClient: sl(),
      airQualityClient: sl(),
      geocodingClient: sl(),
    ),
  );

  sl.registerLazySingleton<FlagEvaluator>(() => const FlagEvaluator());

  sl.registerFactory(() => GetRemoteConfig(sl()));
  sl.registerFactory(() => SwitchConfig(sl()));
  sl.registerFactory(() => ToggleKillSwitch(sl()));
  sl.registerFactory(() => EvaluateFlag(sl(), sl()));
  sl.registerFactory(() => GetWeather(sl()));
  sl.registerFactory(() => SearchCity(sl()));

  sl.registerLazySingleton<RemoteConfigBloc>(
    () => RemoteConfigBloc(
      repository: sl(),
      getRemoteConfig: sl(),
      switchConfig: sl(),
      toggleKillSwitch: sl(),
      flagEvaluator: sl(),
    ),
    dispose: (bloc) => bloc.close(),
  );

  sl.registerFactory(() => WeatherBloc(sl()));
}
