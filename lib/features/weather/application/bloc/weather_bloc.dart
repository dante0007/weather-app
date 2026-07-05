import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/location/domain/entities/user_location.dart';
import 'package:weather_app/core/location/domain/usecases/get_current_location.dart';
import 'package:weather_app/features/weather/application/bloc/weather_event.dart';
import 'package:weather_app/features/weather/application/bloc/weather_state.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/top_cities_for_country.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(
    this._getWeather,
    this._getCurrentLocation,
    this._topCitiesForCountry,
  ) : super(const WeatherState.initial()) {
    on<WeatherDeviceLocationRequested>(_onDeviceLocationRequested);
    on<WeatherLoadRequested>(_onLoadRequested);
    on<WeatherCityChanged>(_onCityChanged);
    on<WeatherRefreshRequested>(_onRefreshRequested);
    on<WeatherTopCitiesRequested>(_onTopCitiesRequested);
  }

  static const _locationTimeout = Duration(seconds: 10);

  final GetWeather _getWeather;
  final GetCurrentLocation _getCurrentLocation;
  final TopCitiesForCountry _topCitiesForCountry;

  double? _lat;
  double? _lon;
  String? _cityName;
  String _countryCode = AppConstants.fallbackCountryCode;

  Future<void> _onDeviceLocationRequested(
    WeatherDeviceLocationRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherState.loading());

    final (:location, :notice) = await _resolveDeviceLocation();
    _countryCode = location.countryCode.isNotEmpty
        ? location.countryCode
        : AppConstants.fallbackCountryCode;

    await _fetchWeather(
      lat: location.latitude,
      lon: location.longitude,
      cityName: location.cityName,
      locationNotice: notice,
      emit: emit,
    );
  }

  Future<({UserLocation location, Failure? notice})>
      _resolveDeviceLocation() async {
    try {
      final result = await _getCurrentLocation()
          .timeout(_locationTimeout);

      return result.fold(
        (failure) => (
          location: _fallbackLocation(),
          notice: _locationNoticeFor(failure),
        ),
        (location) => (location: location, notice: null),
      );
    } catch (_) {
      return (
        location: _fallbackLocation(),
        notice: const Failure.locationUnavailable(),
      );
    }
  }

  Failure? _locationNoticeFor(Failure failure) {
    return failure.maybeWhen(
      locationPermissionDenied: () => failure,
      locationUnavailable: () => failure,
      orElse: () => null,
    );
  }

  UserLocation _fallbackLocation() {
    return const UserLocation(
      latitude: AppConstants.fallbackLat,
      longitude: AppConstants.fallbackLon,
      cityName: AppConstants.fallbackCityName,
      countryCode: AppConstants.fallbackCountryCode,
      countryName: 'United States',
    );
  }

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
    final lat = _lat;
    final lon = _lon;
    final cityName = _cityName;

    if (lat == null || lon == null || cityName == null) {
      return _onDeviceLocationRequested(
        const WeatherDeviceLocationRequested(),
        emit,
      );
    }

    return _fetchWeather(
      lat: lat,
      lon: lon,
      cityName: cityName,
      emit: emit,
    );
  }

  Future<void> _onTopCitiesRequested(
    WeatherTopCitiesRequested event,
    Emitter<WeatherState> emit,
  ) async {
    final currentState = state;
    if (currentState is! WeatherLoaded) {
      return;
    }

    final result = await _topCitiesForCountry(
      TopCitiesForCountryParams(
        countryCode: event.countryCode,
        excludeCityName: event.excludeCityName,
      ),
    );

    result.fold(
      (_) {},
      (cities) => emit(currentState.copyWith(otherCities: cities)),
    );
  }

  Future<void> _fetchWeather({
    required double lat,
    required double lon,
    required String cityName,
    required Emitter<WeatherState> emit,
    Failure? locationNotice,
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
      (bundle) {
        emit(
          WeatherState.loaded(
            bundle,
            locationNotice: locationNotice,
          ),
        );
        add(
          WeatherEvent.topCitiesRequested(
            countryCode: _countryCode,
            excludeCityName: bundle.cityName,
          ),
        );
      },
    );
  }
}
