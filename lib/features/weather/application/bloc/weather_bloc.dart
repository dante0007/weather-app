import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/application/bloc/weather_state.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._getWeather) : super(const WeatherState.initial()) {
    on<WeatherLoadRequested>(_onLoadRequested);
    on<WeatherCityChanged>(_onCityChanged);
    on<WeatherRefreshRequested>(_onRefreshRequested);
  }

  static const double defaultLat = 40.71;
  static const double defaultLon = -74.01;
  static const String defaultCityName = 'New York';

  final GetWeather _getWeather;

  double? _lat;
  double? _lon;
  String? _cityName;

  Future<void> _onLoadRequested(
    WeatherLoadRequested event,
    Emitter<WeatherState> emit,
  ) {
    return _fetchWeather(
      lat: event.lat,
      lon: event.lon,
      cityName: event.cityName,
      emit: emit,
    );
  }

  Future<void> _onCityChanged(
    WeatherCityChanged event,
    Emitter<WeatherState> emit,
  ) {
    return _fetchWeather(
      lat: event.city.lat,
      lon: event.city.lon,
      cityName: event.city.name,
      emit: emit,
    );
  }

  Future<void> _onRefreshRequested(
    WeatherRefreshRequested event,
    Emitter<WeatherState> emit,
  ) {
    return _fetchWeather(
      lat: _lat ?? defaultLat,
      lon: _lon ?? defaultLon,
      cityName: _cityName ?? defaultCityName,
      emit: emit,
    );
  }

  Future<void> _fetchWeather({
    required double lat,
    required double lon,
    required String cityName,
    required Emitter<WeatherState> emit,
  }) async {
    emit(const WeatherState.loading());

    _lat = lat;
    _lon = lon;
    _cityName = cityName;

    final result = await _getWeather(
      GetWeatherParams(lat: lat, lon: lon, cityName: cityName),
    );

    result.fold(
      (failure) => emit(WeatherState.error(failure)),
      (bundle) => emit(WeatherState.loaded(bundle)),
    );
  }
}
