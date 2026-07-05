// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherBundle {

 CurrentWeather get current; HourlyForecast get hourly; DailyForecast get daily; AirQuality get airQuality; String get cityName;
/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherBundleCopyWith<WeatherBundle> get copyWith => _$WeatherBundleCopyWithImpl<WeatherBundle>(this as WeatherBundle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherBundle&&(identical(other.current, current) || other.current == current)&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,current,hourly,daily,airQuality,cityName);

@override
String toString() {
  return 'WeatherBundle(current: $current, hourly: $hourly, daily: $daily, airQuality: $airQuality, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $WeatherBundleCopyWith<$Res>  {
  factory $WeatherBundleCopyWith(WeatherBundle value, $Res Function(WeatherBundle) _then) = _$WeatherBundleCopyWithImpl;
@useResult
$Res call({
 CurrentWeather current, HourlyForecast hourly, DailyForecast daily, AirQuality airQuality, String cityName
});


$CurrentWeatherCopyWith<$Res> get current;$HourlyForecastCopyWith<$Res> get hourly;$DailyForecastCopyWith<$Res> get daily;$AirQualityCopyWith<$Res> get airQuality;

}
/// @nodoc
class _$WeatherBundleCopyWithImpl<$Res>
    implements $WeatherBundleCopyWith<$Res> {
  _$WeatherBundleCopyWithImpl(this._self, this._then);

  final WeatherBundle _self;
  final $Res Function(WeatherBundle) _then;

/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? hourly = null,Object? daily = null,Object? airQuality = null,Object? cityName = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentWeather,hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyForecast,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyForecast,airQuality: null == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherCopyWith<$Res> get current {
  
  return $CurrentWeatherCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<$Res> get hourly {
  
  return $HourlyForecastCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyForecastCopyWith<$Res> get daily {
  
  return $DailyForecastCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res> get airQuality {
  
  return $AirQualityCopyWith<$Res>(_self.airQuality, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherBundle].
extension WeatherBundlePatterns on WeatherBundle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherBundle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherBundle value)  $default,){
final _that = this;
switch (_that) {
case _WeatherBundle():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherBundle value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherBundle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrentWeather current,  HourlyForecast hourly,  DailyForecast daily,  AirQuality airQuality,  String cityName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherBundle() when $default != null:
return $default(_that.current,_that.hourly,_that.daily,_that.airQuality,_that.cityName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrentWeather current,  HourlyForecast hourly,  DailyForecast daily,  AirQuality airQuality,  String cityName)  $default,) {final _that = this;
switch (_that) {
case _WeatherBundle():
return $default(_that.current,_that.hourly,_that.daily,_that.airQuality,_that.cityName);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrentWeather current,  HourlyForecast hourly,  DailyForecast daily,  AirQuality airQuality,  String cityName)?  $default,) {final _that = this;
switch (_that) {
case _WeatherBundle() when $default != null:
return $default(_that.current,_that.hourly,_that.daily,_that.airQuality,_that.cityName);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherBundle implements WeatherBundle {
  const _WeatherBundle({required this.current, required this.hourly, required this.daily, required this.airQuality, required this.cityName});
  

@override final  CurrentWeather current;
@override final  HourlyForecast hourly;
@override final  DailyForecast daily;
@override final  AirQuality airQuality;
@override final  String cityName;

/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherBundleCopyWith<_WeatherBundle> get copyWith => __$WeatherBundleCopyWithImpl<_WeatherBundle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherBundle&&(identical(other.current, current) || other.current == current)&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,current,hourly,daily,airQuality,cityName);

@override
String toString() {
  return 'WeatherBundle(current: $current, hourly: $hourly, daily: $daily, airQuality: $airQuality, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class _$WeatherBundleCopyWith<$Res> implements $WeatherBundleCopyWith<$Res> {
  factory _$WeatherBundleCopyWith(_WeatherBundle value, $Res Function(_WeatherBundle) _then) = __$WeatherBundleCopyWithImpl;
@override @useResult
$Res call({
 CurrentWeather current, HourlyForecast hourly, DailyForecast daily, AirQuality airQuality, String cityName
});


@override $CurrentWeatherCopyWith<$Res> get current;@override $HourlyForecastCopyWith<$Res> get hourly;@override $DailyForecastCopyWith<$Res> get daily;@override $AirQualityCopyWith<$Res> get airQuality;

}
/// @nodoc
class __$WeatherBundleCopyWithImpl<$Res>
    implements _$WeatherBundleCopyWith<$Res> {
  __$WeatherBundleCopyWithImpl(this._self, this._then);

  final _WeatherBundle _self;
  final $Res Function(_WeatherBundle) _then;

/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? hourly = null,Object? daily = null,Object? airQuality = null,Object? cityName = null,}) {
  return _then(_WeatherBundle(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentWeather,hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyForecast,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyForecast,airQuality: null == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherCopyWith<$Res> get current {
  
  return $CurrentWeatherCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<$Res> get hourly {
  
  return $HourlyForecastCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyForecastCopyWith<$Res> get daily {
  
  return $DailyForecastCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}/// Create a copy of WeatherBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res> get airQuality {
  
  return $AirQualityCopyWith<$Res>(_self.airQuality, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}

// dart format on
