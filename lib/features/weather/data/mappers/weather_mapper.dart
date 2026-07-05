import 'package:weather_app/features/weather/data/models/air_quality_response_dto.dart';
import 'package:weather_app/features/weather/data/models/forecast_response_dto.dart';
import 'package:weather_app/features/weather/data/models/geocoding_response_dto.dart';
import 'package:weather_app/features/weather/domain/entities/air_quality.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/daily_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/geo_city.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecast.dart';
import 'package:weather_app/features/weather/domain/entities/weather_bundle.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';

CurrentWeather mapCurrentWeather(
  ForecastCurrentDto current, {
  double precipitationProbability = 0,
}) {
  return CurrentWeather(
    temperature: current.temperature2m,
    feelsLike: current.apparentTemperature,
    condition: WeatherCondition.fromWmoCode(current.weatherCode),
    humidity: current.relativeHumidity2m,
    precipitationProbability: precipitationProbability,
    windSpeed: current.windSpeed10m,
    windDirection: current.windDirection10m,
    uvIndex: current.uvIndex,
    isDay: current.isDay == 1,
  );
}

List<HourSlot> mapHourlySlots(
  ForecastHourlyDto hourly, {
  DateTime? now,
  int limit = 12,
}) {
  final reference = now ?? DateTime.now();
  final slots = <HourSlot>[];

  for (var i = 0; i < hourly.time.length; i++) {
    slots.add(
      HourSlot(
        time: DateTime.parse(hourly.time[i]),
        temperature: hourly.temperature2m[i],
        condition: WeatherCondition.fromWmoCode(hourly.weatherCode[i]),
        precipitationProbability: hourly.precipitationProbability[i],
      ),
    );
  }

  return slots
      .where((slot) => !slot.time.isBefore(reference))
      .take(limit)
      .toList();
}

List<DaySlot> mapDailySlots(ForecastDailyDto daily) {
  final days = <DaySlot>[];

  for (var i = 0; i < daily.time.length; i++) {
    days.add(
      DaySlot(
        date: DateTime.parse(daily.time[i]),
        condition: WeatherCondition.fromWmoCode(daily.weatherCode[i]),
        tempMax: daily.temperature2mMax[i],
        tempMin: daily.temperature2mMin[i],
      ),
    );
  }

  return days;
}

AirQualityCategory mapAirQualityCategory(int aqi) {
  if (aqi <= 50) {
    return AirQualityCategory.good;
  }
  if (aqi <= 100) {
    return AirQualityCategory.moderate;
  }
  if (aqi <= 150) {
    return AirQualityCategory.unhealthyForSensitiveGroups;
  }
  if (aqi <= 200) {
    return AirQualityCategory.unhealthy;
  }
  if (aqi <= 300) {
    return AirQualityCategory.veryUnhealthy;
  }
  return AirQualityCategory.hazardous;
}

String mapDominantPollutant(AirQualityCurrentDto current) {
  final pollutants = <String, double>{
    'pm2_5': current.pm25 ?? 0,
    'pm10': current.pm10 ?? 0,
    'ozone': current.ozone ?? 0,
  };

  return pollutants.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
}

AirQuality mapAirQuality(AirQualityCurrentDto current) {
  final aqi = (current.usAqi ?? 0).round();

  return AirQuality(
    aqi: aqi,
    category: mapAirQualityCategory(aqi),
    dominantPollutant: mapDominantPollutant(current),
  );
}

WeatherBundle mapWeatherBundle({
  required ForecastResponseDto forecast,
  required AirQualityResponseDto airQuality,
  required String cityName,
  DateTime? now,
}) {
  final hourlySlots = mapHourlySlots(forecast.hourly, now: now);
  final currentPrecipProbability = hourlySlots.isEmpty
      ? 0.0
      : hourlySlots.first.precipitationProbability;

  return WeatherBundle(
    cityName: cityName,
    current: mapCurrentWeather(
      forecast.current,
      precipitationProbability: currentPrecipProbability,
    ),
    hourly: HourlyForecast(slots: hourlySlots),
    daily: DailyForecast(days: mapDailySlots(forecast.daily)),
    airQuality: mapAirQuality(airQuality.current),
  );
}

List<GeoCity> mapGeoCities(GeocodingResponseDto response) {
  final results = response.results;
  if (results == null || results.isEmpty) {
    return const [];
  }

  return results
      .map(
        (result) => GeoCity(
          name: result.name,
          country: result.country,
          lat: result.latitude,
          lon: result.longitude,
        ),
      )
      .toList();
}
