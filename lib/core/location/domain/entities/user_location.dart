import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';

@freezed
sealed class UserLocation with _$UserLocation {
  const factory UserLocation({
    required double latitude,
    required double longitude,
    required String cityName,
    required String countryCode,
    required String countryName,
  }) = _UserLocation;
}
