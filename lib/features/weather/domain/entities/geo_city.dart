import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_city.freezed.dart';

@freezed
sealed class GeoCity with _$GeoCity {
  const factory GeoCity({
    required String name,
    required String country,
    required double lat,
    required double lon,
  }) = _GeoCity;
}
