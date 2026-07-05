import 'package:weather_app/features/weather/domain/entities/geo_city.dart';

/// Preset cities shown in the dashboard "Other Cities" row.
abstract final class WeatherPresetCities {
  static const List<GeoCity> others = [
    GeoCity(
      name: 'California',
      country: 'United States',
      lat: 36.78,
      lon: -119.42,
    ),
    GeoCity(
      name: 'Las Vegas',
      country: 'United States',
      lat: 36.17,
      lon: -115.14,
    ),
    GeoCity(
      name: 'London',
      country: 'United Kingdom',
      lat: 51.51,
      lon: -0.13,
    ),
  ];
}
